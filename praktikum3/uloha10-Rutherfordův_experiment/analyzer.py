import numpy as np

print(np.sum(np.loadtxt('mereni/ALL0000/F0000CH1.CSV')[:, 1] > 6))
print(np.sum(np.loadtxt('mereni/ALL0002/F0002CH1.CSV')[:, 1] > 6))
print(np.sum(np.loadtxt('mereni/ALL0003/F0003CH1.CSV')[:, 1] > 6))
print(np.sum(np.loadtxt('mereni/ALL0004/F0004CH1.CSV')[:, 1] > 6) )
print(np.sum(np.loadtxt('mereni/ALL0005/F0005CH1.CSV')[:, 1] > 8) )

#print(np.sum(np.loadtxt('mereni/ALL0001/F0001CH1.CSV')[:, 1] > 10))
#total = np.sum(np.loadtxt('mereni/ALL0002/F0000CH1.CSV')[:, 1] > 10)



