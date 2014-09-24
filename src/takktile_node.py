#!/usr/bin/env python

########################################################################
# 
# Publishes raw and calibrated sensor data for the takktile sensor
#
# dynamic information is published at 60Hz
#   /takktile/calibrated
#        zeroed pressure readings from active sensors (to add: thermal compensation)
#    /takktile/contact 
#        are sensors within pressure threshold of resting value (threshold specified 
#		in launch or config file)
#   /takktile/raw
#        raw pressure
#        low-pass-filtered temperature readings (filter coeff specified in launch or config file)
#
# static information is published at 1Hz:
#    /takktile/sensor_info
#       ids
#            which sensors are connected ( 0 - 39, as marked on PCB )
#       xyz
#            coordinates of present sensors (in message index)
#            in meters per ROS conventions, relative to origin at center of bottom edge of board
#            ID -> coodinate map is read from config file, modify to account for sensors that have 
#		been snapped apart
#       calibration
#            calibration coefficients (not yet implemented)
# 
# a service is also started that allows dynamic rezeroing of sensors to compensate for thermal drift
#
# the size of sensor message depends on size of array (length is the number of sensors that respond)
#
# config file stores:
#    frame_id
#   spatial coordinates of sensors
#   threshold
#   calibration coefficients (if specified manually)
#
########################################################################
# rosmake --target=clean -a --build-everything


import roslib; roslib.load_manifest('takktile_ros')
import rospy

import os, inspect   # used for loading conf file relative to script directory
import numpy as np   # used for array operations

from std_srvs.srv import Empty
from geometry_msgs.msg import Point
from takktile_ros.msg import Raw, Touch, Contact, Info

from TakkTile import TakkTile
from yaml import safe_load

class TakkNode:
    def __init__(self, xyz_map, frame_id, temp_lowpass, contact_threshold):
        topic = 'takktile'
        
        # Set up node & topics
        rospy.init_node(topic, anonymous=True)
        rospy.loginfo(rospy.get_name()+" node initialized")

        # fast topics
        raw_pub        = rospy.Publisher(topic + '/raw',     Raw, queue_size=1)
        calibrated_pub = rospy.Publisher(topic + '/calibrated',   Touch, queue_size=1)
        contact_pub    = rospy.Publisher(topic + '/contact', Contact, queue_size=1)

        # slow topic
        info_pub = rospy.Publisher(topic + '/sensor_info', Info, queue_size=1)
        # initialize connection to TakkTile
        tk = TakkTile()

        # get static values once
        self.alive = tk.alive

        num_alive = len(tk.alive)
        self.calibration = np.zeros(len(tk.alive)) # start with zero-order calibration
        # start rospy service for zeroing sensors
        rospy.Service(topic + '/zero', Empty, self.zero_callback)
        
        # publish sensor data at 60 Hz
        r = rospy.Rate(60) 

	tk.startSampling()

	# initialize temperature lowpass with actual data
        data = tk.getDataRaw()
	# print 'self.getDataRaw():', data

	# unpack the values
	# first - extract the values from the dictionary
	# second - unzip
	[self.pressure, self.temp] = zip(*data.values())
        self.pressure = np.array(self.pressure)
        self.temp = np.array(self.temp)
	self.calibration = -np.array(self.pressure) # zero values at startup

        i = 0
        #k = 0
        while not rospy.is_shutdown():
            i += 1
            if i >= 100: # downsample static info
                info_pub.publish(frame_id, xyz_map, self.alive)
                i = 0
                #k += 100
                #print k

            # publish sensor vals at 100 Hz
            calibrated = [0.0] * num_alive
            contact = [False] * num_alive

	    data=tk.getDataRaw()

	    # unpack the values
	    # first - extract the values from the dictionary
	    # second - unzip

	    #	    print "type(data.values()) ->", type(data.values())
	    #	    dataValues=data.values()
	    #	    print "zip(*dataValues) ->", zip(*dataValues)

	    [self.pressure, temp_new] = zip(*data.values())

            #print self.pressure
            # lowpass filter temperature
            self.temp = TEMPERATURE_LOWPASS * np.array(temp_new) + (1 - TEMPERATURE_LOWPASS) * self.temp
            raw_pub.publish(self.pressure, self.temp)

            calibrated = np.array(self.pressure) + self.calibration
            for j in range(len(self.alive)):
                contact[j] = abs(calibrated[j]) > contact_threshold

            calibrated_pub.publish(calibrated)
            contact_pub.publish(contact)
            # print "published Pressure ->", self.pressure
            r.sleep()
            
	# switch things off
	print "switching off"
	tk.stopSampling()

    # start 'calibrate' service
    def zero_callback(self, msg):
        # global cc and current_values
        self.calibration = -np.array(self.pressure)
        rospy.loginfo(rospy.get_name() + ' zeroed sensors')
        return []

def takktile_zero():
    # helper python interface to be used elsewhere
    rospy.wait_for_service('/takktile/zero')
    try:
         zero = rospy.ServiceProxy('/takktile/zero', Empty)
         zero()
         return 
    except rospy.ServiceException, e:
         print "Service call failed: %s"%e


# helper functions for loading configurations
def load_config(config_file):
    """some messiness here to get proper config files in script directory when called from another directory"""
    cmd_folder = os.path.abspath(os.path.split(inspect.getfile( inspect.currentframe() ))[0])
    config_dict = safe_load(open(os.path.join(cmd_folder, config_file)))
    return config_dict

def get_param(param_name, config, default):
    """load from, in order of precidence, roslauch param, else config file, else default"""
    try:
        return rospy.get_param(param_name)
    except:
        if config.has_key(param_name):
            return config[param_name]    

if __name__ == '__main__':
	#   temp lowpass
	#   contact thresh
	#   frame_id
	#   xyz mapping
	
	config_file = rospy.get_param('config_file', 'takktile.yaml')
	config = load_config(config_file)

	FRAME_ID = get_param('frame_id', config, 'unknown')
	CONTACT_THRESHOLD = get_param('contact_threshold', config, 5)
	TEMPERATURE_LOWPASS = get_param('temperature_lowpass', config, 0.001) # temp = lowpass * temp_new + (1 - lowpass) * temp_old
	XYZ_MAP = []

	print 'contact threshold:', CONTACT_THRESHOLD
	print 'temp lowpass:', TEMPERATURE_LOWPASS
	
	for i in range(40):
		XYZ_MAP += [Point(config[i][0], config[i][1], config[i][2])]

	TakkNode(XYZ_MAP, FRAME_ID, TEMPERATURE_LOWPASS, CONTACT_THRESHOLD)
