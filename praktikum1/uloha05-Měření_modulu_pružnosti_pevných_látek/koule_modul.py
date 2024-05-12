import uncertainties as unc
import math
import numpy as np

d = [0.99]*8 + [1, 0.995]
D = [99.60, 99.70, 99.8, 99.78, 99.7, 99.8, 99.72, 99.78, 99.76, 99.76]
T = [39.89, 39.81, 39.56, 40.05, 39.64, 39.94, 39.82, 39.94, 39.93, 39.72]

m = 5.905
l = unc.ufloat(51.45, 0.003) * 0.01
r = unc.ufloat(np.mean(d), np.std(d, ddof=9)) / 2.0 * 0.001
R = unc.ufloat(np.mean(D), np.std(D, ddof=8)) / 2.0 * 0.001
T = unc.ufloat(np.mean(T), np.std(T, ddof=8)) / 10.0

print('m =', m, 'l =', l, 'r =', r, 'R =', R, 'T =', T)
print('G = ', 16 * math.pi * m * R ** 2 * l / (5 * r ** 4 * T ** 2))




