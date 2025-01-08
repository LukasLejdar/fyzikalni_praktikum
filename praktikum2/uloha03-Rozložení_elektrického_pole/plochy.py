import numpy as np
import matplotlib.pyplot as plt
from scipy import optimize

data = np.loadtxt('plochy.dat')
y0r = np.zeros([8, 2])

for i in range(8):
    x = data[ data[:, 0] == i ][:, 1]
    y = data[ data[:, 0] == i ][:, 2]

    calc_R = lambda yc: np.sqrt(x**2 + (y - yc)**2)
    circle_eq = lambda yc: (R := calc_R(yc)) - R.mean()
    yc = optimize.leastsq(circle_eq, np.sum(y) / len(y))[0]
    r = calc_R(yc[0]).mean()
    
    y0r[i, 0] = yc
    y0r[i, 1] = r

    circle1 = plt.Circle((0, yc), r, color='black', fill=False)
    plt.gca().add_patch(circle1)
    plt.plot(x, y, 'ro', label="Data Points")

#plt.xlim(-40, 40)
#plt.ylim(-40, 40)
#plt.legend()
#plt.grid(True)
#plt.show()


U = 5
R = 0.015
h = 0.15
y0r = np.array(y0r)
a = np.sqrt(y0r[:, 0]**2 - y0r[:, 1]**2)
l = (1 + y0r[:, 0]/a) / ( y0r[:, 0] / a - 1)
V = (np.log(l) / np.log( (h + a) / R ) + 1) * U/2

print(V) 
print(l)
print(y0r[:, 0])
print(y0r[:, 1])

np.savetxt("ekvi-pot-kruhy.txt", y0r)


