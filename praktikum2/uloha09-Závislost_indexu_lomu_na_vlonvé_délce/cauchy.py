import numpy as np
import scipy.stats as stats
import uncertainties as unc

A = unc.ufloat(1.59147, 0.0007884)
B = unc.ufloat(5.58698, 0.1849) * 1e-15

def f(l):
    return A + B / l**2

ld = 587.6 * 1e-9
lF = 486.1 * 1e-9
lC = 656.3 * 1e-9

vd = (f(ld) - 1) / (f(lF) - f(lC))

print(f(ld))
print(f(lF))
print(f(lC))
print(vd)
