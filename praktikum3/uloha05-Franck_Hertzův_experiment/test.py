import numpy as np
import matplotlib.pyplot as plt

h = 6.6260e-34
q = 1.602e-19
c = 299792458

neon = np.loadtxt('Neon.txt')

lambdas = h*c / ((neon[:, None] - neon[None, :])*q)

np.savetxt('lambdas', lambdas, fmt='%.9e')
lambdas_arr = np.sort(np.unique(lambdas.ravel()))

lrange = [515, 740]

lambdas_arr = lambdas_arr[ (515e-9 < lambdas_arr) & (lambdas_arr < 740e-9) ]

kroker = np.loadtxt('KROKER0004.trt')

plt.plot(kroker[:, 0], kroker[:, 1])
for lam in lambdas_arr:
    plt.axvline(x=lam*1e9, color='red', linestyle='--', alpha=0.5)
plt.show()

print(lambdas)

