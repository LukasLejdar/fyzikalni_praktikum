import uncertainties as unc
import math

R = unc.ufloat(0.570, 0.001) * 0.001
L = unc.ufloat(165, 0.5) * 0.001
p = unc.ufloat(1117, 4) + 101
V = unc.ufloat(38.2, 0.3) * 10 ** (-6)
t = unc.ufloat(128, 0.5) 

print( math.pi * R ** 4 * p * t / (8 * V * L) )
