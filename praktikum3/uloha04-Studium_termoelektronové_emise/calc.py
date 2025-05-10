import numpy as np

schotty1 = np.loadtxt('schotty-1,92A.txt')
schotty2 = np.loadtxt('schotty-1,98A.txt')

print('1.92 noise mean', np.mean(schotty1[np.where(schotty1[:, 2] < -2), 3]))
print('1.98 noise mean', np.mean(schotty2[np.where(schotty2[:, 2] < -2), 3]))



print()
