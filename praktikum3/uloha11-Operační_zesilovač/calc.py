import numpy as np

data = np.loadtxt('invertujici.txt')

print(data[:, 0] * -2)


data = np.loadtxt('neinvertujici.txt')

print(data[:, 0] * (30) / (10) )

data = np.loadtxt('rozdilovy.txt')

print( 2*(data[:, 1] - data[:, 0]))

data = np.loadtxt('pasmo.txt')

print(data[:, 1] / 2.133)

data =  np.loadtxt('dolnofrekvencni_propust.txt')

CF = 10e-9
RF = 100e3
RA = 10e3

U1 = 1.11802

print((RF/RA) /( 1 )**0.5)

print(U1 * (RF/RA) /( 1 + (2*np.pi*data[:, 0]*CF*RF)**2 )**0.5)

print((RF/RA) /( 1 + (2*np.pi*data[:, 0]*CF*RF)**2 )**0.5)
