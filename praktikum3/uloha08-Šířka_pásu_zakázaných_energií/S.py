import numpy as np
from scipy.interpolate import interp1d

h = 6.6260 * 1e-34
c = 299792458

l1 = 1160 * 1e-9
l2 = 1930 * 1e-9

eV = 1.602176634 * 1e-19

print(h*c/(l1 * eV), h*c/(l2 * eV), h*c/(0.9*1e-6 * eV))

#cejchovani = np.loadtxt('cejchovani.txt')
#germanium = np.loadtxt('germanium.txt')
#silicon = np.loadtxt('silicon.txt')
#
#cejchovani = interp1d(cejchovani[:, 0], cejchovani[:, 1])
#
#germanium = germanium[germanium[:, 0] >= 1.0, :]
#germanium[:, 1] = germanium[:, 1] / cejchovani(germanium[:, 0])
#np.savetxt('germanium_S.txt', germanium)
#
#
#silicon = silicon[silicon[:, 0] >= 1.0, :]
#silicon[:, 1] = silicon[:, 1] / cejchovani(silicon[:, 0])
#np.savetxt('silicon_S.txt', silicon)
#
#D = cejchovani[:, :2]
#
#print(D.shape)
