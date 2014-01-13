#!/usr/bin/env python

########################################################################
#
# displays takktile visuals on an image of the hand 
#
########################################################################
# rosmake --target=clean -a --build-everything


import roslib; roslib.load_manifest('takktile_ros')
import rospy
import numpy as np
import os
from takktile_ros.msg import Touch
from dot_display import DotDisplay 

NODENAME = 'TakkViz'

BACKGROUND = os.path.join(os.path.split(__file__)[0], 'takkarray.bmp')

xvals = np.array([34,109,186,260,336])
yvals = np.array([563,592,563,592,563])

xx = np.concatenate((xvals, xvals, xvals, xvals, xvals, xvals, xvals, xvals))
yy = np.concatenate((yvals, yvals-75, yvals-150, yvals-225, yvals-300, yvals-375, yvals-450, yvals-525, yvals-600))

DOT_POS = zip(xx,yy)

DOT_RADIUS = 6

DATA_SCALE = 100.;

class DotVizNode:
    def __init__(self): 
        # Set up node & topics
        rospy.init_node(NODENAME, anonymous=True)
        rospy.loginfo(rospy.get_name()+" node initialized")

	self.display = DotDisplay(BACKGROUND, textpos=DOT_POS)
	rospy.Subscriber('/takktile/calibrated', Touch, self.callback)

   	rospy.spin()

    def callback(self, data):
	color = np.minimum(np.ones(len(data.pressure)), np.abs(np.array(data.pressure) / DATA_SCALE))

	self.display.update(color, DOT_POS, dotradius=DOT_RADIUS)

if __name__ == '__main__':
	dv = DotVizNode()
