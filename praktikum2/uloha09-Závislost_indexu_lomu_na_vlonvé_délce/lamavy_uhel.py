import numpy as np
import scipy.stats as stats
import uncertainties as unc

def average(arr):
    sem = np.std(arr, ddof=1) / np.sqrt(len(arr))
    coef = stats.t.ppf((1 + 0.9973) / 2, len(arr) - 1)
    return unc.ufloat(np.mean(arr), sem*coef)

data = np.loadtxt('lamavy_uhel.txt')
B1 = data[:, 0] + data[:, 1] / 60 + data[:, 2] / 360 
B2 = data[:, 3] + data[:, 4] / 60 + data[:, 5] / 360 

w = 180 - B1 + B2
print(average(w))
