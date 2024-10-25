import numpy as np
import scipy.stats as stats

data = np.loadtxt('planparalela.txt')

d = 10.10  * 1e-3
data[:, 1] *= 1e-3
data[:, 0] *= np.pi / 180

n = np.sqrt( np.sin(data[:, 0])**2 + np.cos(data[:, 0])**2 * ( 1 - data[:, 1] / (d*np.sin(data[:, 0])) ) ** (-2) )

sem = np.std(n, ddof=1) / np.sqrt(len(n))
coef = stats.t.ppf((1 + 0.9973) / 2, len(n) - 1)


print(n, "\n")
print(np.mean(n), sem * coef)
