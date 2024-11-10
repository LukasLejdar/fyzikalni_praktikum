import numpy as np
import scipy.stats as stats
import uncertainties as unc

def average(arr):
    sem = np.std(arr, ddof=1) / np.sqrt(len(arr))
    coef = stats.t.ppf((1 + 0.9973) / 2, len(arr) - 1)
    return unc.ufloat(np.mean(arr), sem*coef)

data = np.loadtxt('sferometrem.txt') * 0.001

z = np.array([34.99, 34.92, 34.95, 34.90, 34.85,]) * 0.001 / 2
Z = np.array([37.17, 37.19, 37.18, 37.18, 37.16,]) * 0.001 / 2
z = average(z)
Z = average(Z)

roz_h1 = average(data[:, 0])
roz_h2 = average(data[:, 1])
roz_r1 = (roz_h1**2 + z**2) / (2 * roz_h1)
roz_r2 = (roz_h2**2 + z**2) / (2 * roz_h2)

spoj_h1 = average(data[:, 2])
spoj_h2 = average(data[:, 3])
spoj_r1 = (spoj_h1**2 + Z**2) / (2 * spoj_h1)
spoj_r2 = (spoj_h2**2 + Z**2) / (2 * spoj_h2)

spoj_h2 = 0
spoj_r2 = 9999999999


print('z', z)
print('Z', Z)
print('roz h1', roz_h1)
print('roz h2', roz_h2)
print('spoj h1', spoj_h1)
print('spoj h2', spoj_h2)

print('roz r1', roz_r1)
print('roz r2', roz_r2)
print('spoj r1', spoj_r1)
print('spoj r2', spoj_r2)

spoj_fp = unc.ufloat(0.165, 0.005)
spoj_fB1 = unc.ufloat(0.16, 0.001)
spoj_fB2 = unc.ufloat(0.169, 0.009)
spoj_fB = unc.ufloat(0.165, 0.009)

roz_fp = unc.ufloat(-0.30, 0.03)



spoj_fs = np.array([spoj_fp, spoj_fB1, spoj_fB2, spoj_fB])
spoj_ns = 1 + 1/(spoj_fs * (- 1/spoj_r1))
roz_ns = 1 + 1/(roz_fp * (-1/roz_r2 - 1/roz_r1))

print(spoj_ns)
print(roz_ns)



