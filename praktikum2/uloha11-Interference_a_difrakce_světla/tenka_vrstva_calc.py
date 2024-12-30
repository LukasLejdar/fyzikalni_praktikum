import numpy as np
import scipy.stats as stats
import uncertainties as unc

def average(arr):
    sem = np.std(arr, ddof=1) / np.sqrt(len(arr))
    coef = stats.t.ppf((1 + 0.9973) / 2, len(arr) - 1)
    return unc.ufloat(np.mean(arr), sem*coef)


data = np.loadtxt('vrstva.txt')

l = 532.1 * 1e-9
x1v = data[:, 0:2] - data[:, 2:4]
x2v = data[:, 2:4] - data[:, 4:6]

x1 = np.linalg.norm(x1v, axis=1)
x2 = np.abs(np.sum(x1v * x2v, axis=1)) / x1

t = 0.5*l * x2/x1

print(t)
print(average(t))
print()
