import numpy as np
import uncertainties as unc
import math
import scipy.stats as stats

k = stats.t.ppf(0.5 + 0.9973 / 2, df=9)
d = np.array([ 0.50, 0.50, 0.50, 0.50, 0.51, 0.50, 0.49, 0.50, 0.49, 0.50 ]) * 0.001
d = unc.ufloat(np.mean(d), np.std(d, ddof=1) / math.sqrt(len(d)) * k)
k = unc.ufloat(449, 4) * 1e-6
l = 1567 * 0.001

print(4 * 9.809980 * l / (math.pi * d ** 2 * k))


print(d)
