import pygame as pg
import numpy as np
import os

###############################################################################
#
# simple class to display takktile signals on top of an image using pygame
# dots change color as value changes
# 
# Leif Jentoft, Spring 2013
##############################################################################

class DotDisplay:
	def __init__(self, background, textpos=[], text=[], fontsize=12, fontcolor=(0,0,0), heartbeat=False):
		# background is a bitmap background image
		# dotsize is the radius of the dots in pixels
		# dotpos is a list of dot center locations in pixel coords 
		# (0,0) = upper left, x goes across screen, y goes down
		# e.g. ((10,10),(10,20))
		# these can be easily retrieved from an image using the pixel coordinates of the mouse in gimp

		# set up screen
		pg.init()

		img = pg.image.load(background)
		self.screen = pg.display.set_mode(img.get_size())
		pg.mouse.set_visible(True)
		self.screen.blit(img, (0,0))

		for i in range(len(textpos)):
			font = pg.font.SysFont('Sans', fontsize)
			if text == []:
				label = font.render(str(i), 1, fontcolor) 
			else:
				label = font.render(str(text[i]), 1, fontcolor) 
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
	dot_pos = [(34, 563), (109, 592), (186, 563), (260, 592), (336, 563), \
		(34, 488), (109, 517), (186, 488), (260, 517), (336, 488), \
		(34, 413), (109, 442), (186, 413), (260, 442), (336, 413), \
		(34, 338), (109, 367), (186, 338), (260, 367), (336, 338), \
		(34, 263), (109, 292), (186, 263), (260, 292), (336, 263), \
		(34, 188), (109, 217), (186, 188), (260, 217), (336, 188), \
		(34, 113), (109, 142), (186, 113), (260, 142), (336, 113), \
		(34, 38), (109, 67), (186, 38), (260, 67), (336, 38)]


	background = os.path.join(os.path.split(__file__)[0], 'takkarray.bmp')
	
	display = DotDisplay(background)

	display.update(np.random.random(len(dot_pos)), dot_pos, dotradius=6)

	raw_input('press enter to exit')
	exit()
