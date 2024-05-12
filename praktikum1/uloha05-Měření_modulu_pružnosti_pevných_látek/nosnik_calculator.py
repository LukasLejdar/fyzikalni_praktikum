
import uncertainties as unc
import numpy as np
import pandas as pd;
import math

def calculate(material, b, a, k):
    k = unc.ufloat(k[0], k[1]) * 10 ** -6
    a = unc.ufloat(np.mean(a), np.std(a, ddof=9)) * 0.001
    b = unc.ufloat(np.mean(b), np.std(b, ddof=8)) * 0.01
    l = unc.ufloat(89.9, 0.03) * 0.01
    g = 9.81

    print(material, '&', a * 1000, '&', b * 100, '&', k * 10 ** 6, '&', g * l**3 / (4 * k * a ** 3 * b), '\\\\')


table = np.loadtxt("nosniky_rozmery_peta.txt")
calculate('hliník', table[:, 0], table[:, 1], (6800, 8))
calculate('měď', table[:, 2], table[:, 3], (3894, 9))
calculate('mosaz', table[:, 4], table[:, 5], (4770, 5))
calculate('kompozit', table[:, 6], table[:, 7], (1528, 2))

