import numpy as np
from scipy.interpolate import interp1d

P = 1
kb = 1.380649e-23
T = 293 
d = 289e-12

print(kb * T / (2**0.5 * np.pi * d**2 * P))

ratio = -1.75882000838e11

cejchovani = np.loadtxt('cejchovani_indukce.txt')

B = interp1d(cejchovani[:, 0], cejchovani[:, 1], fill_value='extrapolate')

data = np.loadtxt('mereni.txt').reshape(-1, 4)

r = 2 * data[:, 1] / (B(data[:, 0]) * data[:, 2]/2)**2

R = ( 2 * data[:, 1] / ratio )**0.5 / (B(data[:, 0]))

print(B(data[:, 0]))
print(r)
print(ratio)
print(R)

print()


