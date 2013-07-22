import pygame as pg
import numpy as np

import sys, os # used to avoid specifying absolute filepath for config files

# simple class to display takktile signals on top of an image of the robot
# using pygame; dots change color as value changes
# 
# Leif Jentoft, Spring 2013

	
class DotDisplay:
	def __init__(self, background, textpos=[], fontsize=12, fontcolor=(0,0,0)):
		# background is a bitmap background image
		# dotsize is the radius of the dots in pixels
		# dotpos is a list of dot center locations in pixel coords (0,0) = upper left, x goes across screen, y goes down
		# e.g. ((10,10),(10,20))

		# set up screen
		pg.init()

		img = pg.image.load(background)
		self.screen = pg.display.set_mode(img.get_size())
		pg.mouse.set_visible(True)
		self.screen.blit(img, (0,0))

		for i in range(len(textpos)):
			font = pg.font.SysFont('Sans', fontsize)
			label = font.render(str(i), 1, fontcolor) 
			self.screen.blit(label, textpos[i]) 

		# values are taken scaled 0-1
		pg.display.flip()
			
	def update(self, values, dotpos, dotradius='6', dotcolor=(255,0,0)):
		# values are scaled 0-1
		for i in range(len(values)):
			pos = dotpos[i]
			color = np.array(dotcolor) * values[i]
			pg.draw.circle(self.screen, color, pos, dotradius, 0)		
		pg.display.flip()

if __name__ == '__main__':		
	import time
	dots = ((278,145),(260,140),(243,134),(224,127),(204,121),(102,84),(78,76),(54,68),
		(295,302),(275,309),(253,318),(232,326),(210,333),(93,376),(68,387),(41,397),
		(537,148),(556,138),(575,132),(596,122),(614,113),(713,68),(734,58),(754,47),
		(451,247),(432,244),(412,242),(392,239),(372,237),
		(420,163),(407,175),(393,186),(378,198),(364,210))

	display = DotDisplay(get_fullpath('takkarray.bmp'))

	display.update([1]*len(dots), 6, dots)

	time.sleep(10)

