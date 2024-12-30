import numpy as np
import scipy.stats as stats
import uncertainties as unc

def average(arr):
    sem = np.std(arr, ddof=1) / np.sqrt(len(arr))
    coef = stats.t.ppf((1 + 0.9973) / 2, len(arr) - 1)
    return unc.ufloat(np.mean(arr), sem*coef)

data = np.loadtxt('mrizka.txt')
#data[:, 0] += 6
data *= 1e-3

l = 632.8 * 1e-9

y1 = (data[:, 1] + data[:, 2]) / 2
y2 = (data[:, 3] + data[:, 4]) / 2

d1 = 1*l*np.sqrt(y1**2 + data[:, 0]**2)/y1
d2 = 2*l*np.sqrt(y2**2 + data[:, 0]**2)/y2

d = np.hstack([d1, d2])

np.set_printoptions(linewidth=np.inf)

print(d1)
print(d2)
dav = average(d)
print(dav)
print(1/dav)

d = unc.ufloat(1.657, 0.01)
print(1/d)

print()
