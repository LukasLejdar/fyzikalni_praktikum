import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import root_scalar

d = 400 * 1e-9

tio2 = np.loadtxt('spektroskopie/TIO2.CSV')
bk7 = np.loadtxt('spektroskopie/BK7.CSV')

l = tio2[:, 0]
Tvs = tio2[:, 1]
Ts = bk7[:, 1]

y = Tvs[41:300]
x = l[41:300]

mask_min = (y[0:-2] < y[1:-1]) & (y[1:-1] >= y[2:])
mask_max = (y[0:-2] > y[1:-1]) & (y[1:-1] <= y[2:])

x = x[1:-1]
y = y[1:-1]

nv = 2*y[mask_min] / (1 + y[mask_min]**2)

plt.plot(l, Tvs)
plt.plot(x[mask_min], y[mask_min])
plt.plot(x[mask_max], y[mask_max])
plt.show()

