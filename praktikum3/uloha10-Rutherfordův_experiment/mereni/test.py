import numpy as np

d = 0.227
v = 0.02

x = d/2

r = (x**2 + v**2)**0.5

a = np.arctan(v/x)

chi = 2*a

n = 0.5

w = np.cos(a) * np.cos(a) / ( r**2 * r**2 * np.sin(chi/2)**4 ) 

print(n / w)


x = 0.2
a = np.arctan(v/x)
b = np.arctan(v/(d-x))

print( (a + b) * 180 / np.pi )
