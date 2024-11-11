import numpy as np
import scipy.stats as stats
import uncertainties as unc
from uncertainties import unumpy as unp

def average(arr):
    sem = np.std(arr, ddof=1) / np.sqrt(len(arr))
    coef = stats.t.ppf((1 + 0.9973) / 2, len(arr) - 1)
    return unc.ufloat(np.mean(arr), sem*coef)

data = np.loadtxt('minm_deviace.txt')
B1 = data[:, 0] + data[:, 1] / 60 + data[:, 2] / 360 
B2 = data[:, 3] + data[:, 4] / 60 + data[:, 5] / 360 

delta_m = (B2 - B1) / 2
omega = unc.ufloat(45, 0.05)
n = unp.sin( 0.5*(delta_m + omega) * np.pi / 180 ) / unp.sin( 0.5 * omega * np.pi / 180)

print(delta_m)
print(n)
