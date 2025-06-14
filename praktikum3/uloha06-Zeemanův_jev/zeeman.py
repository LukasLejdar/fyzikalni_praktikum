import numpy as np
import scipy.constants as const
from scipy.interpolate import interp1d
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt
from scipy import stats
import uncertainties as unc

f = 0.05
d = 0.003
n = 1.4519
#n = 1.4560
Z = 6
l = 509e-9

print( (f*Z)**2*n*l/d )


a = 8.59419e-08
b = unc.ufloat(-6.18892e-08, 3.972e-09)


data = np.loadtxt('fabry2.txt')

print(data[1:, 1]**2 - data[:-1, 1]**2)

data = np.loadtxt('zeeman.txt')

rs = data[:, 1:].reshape(6, 3, 3)

d = 0.003
n = 1.4519
#n = 1.4560

#print(const.Planck * const.speed_of_light / (2 * n * d) * (0.206**2 - 0.162**2) / (0.206**2 - 0.208**2))

#print(const.Planck * const.speed_of_light / (2 * n * d) * (0.162**2 - 0.117**2) / (7.2e-8 * ))


#a = np.zeros(6)
#a[0] = np.polyfit(np.arange(3)+1, rs[0, :, 1]**2, 1)[0]
#a[1] = np.polyfit(np.arange(3)+1, rs[1, :, 1]**2, 1)[0]
#a[2] = np.polyfit(np.arange(3)+1, rs[2, :, 1]**2, 1)[0]
#a[3] = np.polyfit(np.arange(3)+1, rs[3, :, 1]**2, 1)[0]
#a[4] = np.polyfit(np.arange(3)+1, rs[4, :, 1]**2, 1)[0]
#a[5] = np.polyfit(np.arange(3)+1, rs[5, :, 1]**2, 1)[0]

E = const.Planck * const.speed_of_light / (2 * n * d) * ( rs[:, :-1, :-1]**2 - rs[:, :-1, 1:]**2 ) / ( rs[:, 1:, 1:2]**2 - rs[:, :-1, 1:2]**2 )

E = const.Planck * const.speed_of_light / (2 * n * d) * ( rs[:, :, :-1]**2 - rs[:, :, 1:]**2 ) / a

print(np.swapaxes(E, 0, 1))

dE = np.zeros([36, 3])

dE[:, 0] = np.repeat(data[:, 0], 6, axis=0)
dE[:, 1] = E.ravel()
dE[:, 2] = ( np.arange(36) + 1 )  % 2


np.savetxt('E.txt', dE)





