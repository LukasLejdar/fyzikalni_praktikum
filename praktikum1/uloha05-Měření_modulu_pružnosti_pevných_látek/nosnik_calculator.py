
import uncertainties as unc
import numpy as np
import math
import scipy.stats as stats

def kf(ddof):
    return stats.t.ppf(0.5 + 0.9973 / 2, df=ddof)

def calculate(material, b, a, k):
    k = unc.ufloat(k[0], k[1]) * 1e-6 
    a = unc.ufloat(np.mean(a), np.std(a, ddof=1) / math.sqrt(len(a)) * kf(len(a)-1)) * 0.001
    b = unc.ufloat(np.mean(b), np.std(b, ddof=1) / math.sqrt(len(b)) * kf(len(b)-1)) * 0.01
    l = unc.ufloat(89.9, 0.03) * 0.01
    g = 9.81

    print(material, '&', a * 1000, '&', b * 100, '&', k * 10 ** 6, '&', g * l**3 / (4 * k * a ** 3 * b), '\\\\')


table = np.loadtxt("nosniky_rozmery.txt")
calculate('dural', table[:, 0], table[:, 1], (6800, 8))
calculate('mosaz', table[:, 2], table[:, 3], (3894, 9))
calculate('měď', table[:, 4], table[:, 5], (4770, 5))
calculate('ocel', table[:, 6], table[:, 7], (1528, 2))

def E(b, a, k):
    k = unc.ufloat(k[0], k[1]) * 1e-6 
    a = unc.ufloat(np.mean(a), np.std(a, ddof=1) / math.sqrt(len(a)) * kf(len(a)-1)) * 0.001
    b = unc.ufloat(np.mean(b), np.std(b, ddof=1) / math.sqrt(len(b)) * kf(len(b)-1)) * 0.01
    l = unc.ufloat(89.9, 0.03) * 0.01
    g = 9.809980

    return g * l**3 / (4 * k * a ** 3 * b)

table = np.loadtxt("nosniky_rozmery.txt")
print('dural', E(table[:, 0], table[:, 1], (6800, 8)))
print('mosaz', E(table[:, 4], table[:, 5], (4770, 5)))
print('měď', E(table[:, 2], table[:, 3], (3894, 9)))
print('ocel', E(table[:, 6], table[:, 7], (1528, 2)))
