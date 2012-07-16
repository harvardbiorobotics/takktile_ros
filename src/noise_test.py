# sensor performance test

from TakkTile2 import TakkTile2
import numpy as np
import matplotlib.pyplot as plt
from time import sleep

tk = TakkTile2()

# noise
samples = 100
pressure = np.zeros([samples, tk.num_sensors])
temp = np.zeros([samples, tk.num_sensors])

for i in range(samples):
	[pressure[i], temp[i]] = tk.getData()

std_pressure = np.std(pressure, 0)
std_temp = np.std(temp, 0)

print "sensors alive:"
print tk.alive
print "noise (std deviation across %i samples)"%samples
print "pressure:   ", std_pressure
print "temperature:", std_temp

plt.plot(pressure)
plt.title('Pressure std. dev %f'%np.mean(std_pressure))
plt.xlabel('sample')
plt.ylabel('raw reading')

plt.figure()
plt.plot(temp)
plt.title('Temperature std. dev %f'%np.mean(std_temp))
plt.xlabel('sample')
plt.ylabel('raw reading')
plt.show()
