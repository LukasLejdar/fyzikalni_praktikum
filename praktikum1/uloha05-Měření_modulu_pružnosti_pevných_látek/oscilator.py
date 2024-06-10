import uncertainties as unc
import math
import numpy as np

table = np.loadtxt("oscilator_rozmery.txt")
d = table[:, 0]
D = table[:, 1]
T = table[:, 2]

d = unc.ufloat(np.mean(d), np.std(d) * 4.094) * 0.001
D = unc.ufloat(np.mean(D), np.std(D) * 4.094) * 0.001
T = unc.ufloat(np.mean(T), np.std(T) * 4.094) / 10.0
l = unc.ufloat(51.45, 0.003) * 0.01
m = 5.905

print(16 * math.pi * m * (D/2) ** 2 * l / (5 * (d/2) ** 4 * T ** 2))


print()
print(d)
print(D)
print(T)



