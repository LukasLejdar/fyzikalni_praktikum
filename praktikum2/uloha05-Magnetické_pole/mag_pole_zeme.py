import uncertainties as unc
import numpy as np
from uncertainties import unumpy as unp
import math

values = np.loadtxt("magnetometr.txt")
r = np.abs(np.hstack([values[:, 0:1], values[:, 0:1]])) * 1e-2
phi1 = np.abs(values[:, 1:3])
phi2 = np.abs(values[:, 3:4])

r = r + np.ones_like(r) * unc.ufloat(0, 0.5) * 1e-3
phi1 = phi1 + np.ones_like(phi1) * unc.ufloat(0, 1)
phi2 = phi2 + np.ones_like(phi2) * unc.ufloat(0, 1)

phi1 *= 2*math.pi/360
phi2 *= 2*math.pi/360

T = unc.ufloat(9.62, 0.04)
m = unc.ufloat(306.3, 0.2) * 1e-3
l = unc.ufloat(123.3, 0.4) * 1e-3
d = unc.ufloat(21.1, 0.1) * 1e-3
u0 = 1.256637 * 1e-6

J = m / 4 * ( d**2/4 + l**2/3)

Hz = 1/T * (7 * math.pi * J/u0 * (r ** 3 * ( 1.5 * unp.tan(phi1) + 4*unp.tan(phi2)) )**(-1) ) ** (0.5)

np.set_printoptions(threshold=np.inf)
np.set_printoptions(linewidth=np.inf)
print( "Hz", np.average(Hz))
