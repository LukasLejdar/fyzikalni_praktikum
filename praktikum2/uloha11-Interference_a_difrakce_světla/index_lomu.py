import numpy as np
import scipy.stats as stats
import uncertainties as unc

N = np.array([36, 37, 36.5, 36])
N = N + np.ones_like(N) * unc.ufloat(0, 0.3)
p1 = unc.ufloat(103, 6)
p0 = 1003
d = 0.04
l = 532.1 * 1e-9

n = 1 + 0.5*N*l*p0/(d*(p0 - p1))

print(n)

nominal_values = np.array([val.n for val in n])
std_devs = np.array([val.s for val in n])
weights = 1 / std_devs**2

average = np.sum(nominal_values * weights) / np.sum(weights)
std = np.sqrt(np.sum(1/weights))

print(average, std)
