import numpy as np
import scipy.stats as stats

Up = 4487
Us = 2736
data = np.loadtxt('./odrazivost.txt')
data[:, 1] /= Up
data[:, 2] /= Us
data[:, 1:] = np.sqrt(data[:, 1:])

brewst = 56
bef = data[data[:, 0] < brewst]
aft = data[data[:, 0] > brewst]

nbef = np.sqrt( (1 + bef[:, 2])*(1 + bef[:, 1]) / ( (1 - bef[:, 2])*(1 - bef[:, 1]) ) )
naft = np.sqrt( (1 + aft[:, 2])*(1 - aft[:, 1]) / ( (1 - aft[:, 2])*(1 + aft[:, 1]) ) )

n = np.hstack([nbef, naft])
sem = np.std(n, ddof=1) / np.sqrt(len(n))
coef = stats.t.ppf((1 + 0.9973) / 2, len(n) - 1)


print(n, "\n")
print(np.mean(n), sem * coef)


