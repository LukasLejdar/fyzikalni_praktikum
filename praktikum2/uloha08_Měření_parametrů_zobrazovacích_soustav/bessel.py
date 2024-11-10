import numpy as np
import scipy.stats as stats

data = np.loadtxt('bessel.txt')

#d = data[:, 1] - data[:, 0] 
#delta = data[:, 3] - data[:, 2]

delta = np.array([0.477, 0.412, 0.343, 0.288, 0.186, 0.242, 0.310, 0.378, 0.441, 0.385])
d = np.array([0.910, 0.860, 0.810, 0.760, 0.710, 0.735, 0.785, 0.835, 0.885, 0.840])

f = (d**2 - delta**2) / (4*d)

sem = np.std(f, ddof=1) / np.sqrt(len(f))
coef = stats.t.ppf((1 + 0.9973) / 2, len(f) - 1)

print(d)
print(delta)
print(f)
print(np.mean(f), sem * coef)
