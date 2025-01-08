import numpy as np
import uncertainties as unc

Ri = unc.ufloat(18.9, 2.8) * 1e3
S = unc.ufloat(0.0617, 0.0041)
Rz = 1360

mu = Ri*S
Av = - (S*Ri*Rz) / (Ri + Rz)
AG = (16.07 + 0.037) / (3.7-3.5)
Sd = S / (1 + Rz / Ri)

print('Sd', Sd)
print('mu', Ri*S)
print('Av', Av)
print('AG', AG)


data = np.loadtxt('zesileni.txt')


data[:, 1] += 0.006*data[:, 0]
AM = data[:, 1] / data[:, 0]

print(data)

print(np.mean(AM))
