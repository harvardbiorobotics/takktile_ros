from TakkTile import TakkTile

class TakkTile2(TakkTile):
	# wrapper class to give full-array getData callback
	def __init__(self):
		TakkTile.__init__(self)
		self.alive = self.getAlive()
		self.num_sensors = len(self.alive)
		# self.rows = np.unique(np.array(self.alive)/5)
		print "--- INIT ---"
		print self.calibrationCoefficients

	def getCalibrationCoefficients(self, index):
#		TakkTile.getCalibrationCoefficients(self, index)
		print "--- THIS IS FROM TAKKTILE 2 ---"
		if (self.calibrationCoefficients==0):
			return super(TakkTile2).getCalibrationCoefficients(self, index)
		print self.calibrationCoefficients
#		calib_dict = self.calibrationCoefficients[:]
		self.calibrationCoefficients = [[0.0]*5]*40
#		for i in range(40):
#			self.calibrationCoefficients[i] = [calib_dict[i/5][i%5]['a0'], calib_dict[i/5][i%5]['b1'], calib_dict[i/5][i%5]['b2'], calib_dict[i/5][i%5]['c11'], calib_dict[i/5][i%5]['c12'], calib_dict[i/5][i%5]['c22']]
		return self.calibrationCoefficients

	def getData(self):
		return TakkTile.getDataRaw(self)
