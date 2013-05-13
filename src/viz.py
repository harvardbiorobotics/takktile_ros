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
from takktile_ros.msg import Touch
from dot_display import DotDisplay

NODENAME = 'TakkViz'

BACKGROUND = 'hand.bmp'

DOT_POS = ((102,84),(78,76),(54,68),(278,145),(260,140),(243,134),(224,127),(204,121),
     (713,68),(734,58),(754,47),(537,148),(556,138),(575,132),(596,122),(614,113),
     (93,376),(68,387),(41,397),(295,302),(275,309),(253,318),(232,326),(210,333),
     (451,247),(432,244),(412,242),(392,239),(372,237),
     (420,163),(407,175),(393,186),(378,198),(364,210))

DOT_RADIUS = 6

DATA_SCALE = 255.;

class DotVizNode:
    def __init__(self): 
        # Set up node & topics
        rospy.init_node(NODENAME, anonymous=True)
        rospy.loginfo(rospy.get_name()+" node initialized")

	self.display = DotDisplay(BACKGROUND, DOT_RADIUS, DOT_POS)
	rospy.Subscriber('/takktile_ros/calibrated', Touch, self.callback)

   	rospy.spin()

    def callback(self, data):
	color = np.minimum(np.ones(len(data.pressure)), np.abs(np.array(data.pressure) / DATA_SCALE))

	self.display.update(color)

if __name__ == '__main__':
	dv = DotVizNode()
