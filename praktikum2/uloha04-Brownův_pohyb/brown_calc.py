import numpy as np
import uncertainties as unc

np.set_printoptions(threshold=np.inf)
np.set_printoptions(linewidth=np.inf)
np.set_printoptions(precision=3)

data = np.loadtxt('brown3.txt')
scale = 50 * 1e-6 / 606.130349017437
data *= scale

Ls = np.zeros([0, data.shape[1]])
steps = np.array([1,2,3])

for i in steps:
    indices = np.arange(len(data)-i)
    squares = (data[indices] - data[indices+i])**2
    #L = np.average(squares[:, ::2] + squares[:, 1::2], axis=0)
    L = np.average(squares, axis=0)
    Ls = np.row_stack([Ls, L])

print(Ls)
print(np.average(Ls, axis=1))

t = np.ones_like(Ls)
t[...] = steps[:, None]*5
t = t.flatten()
y = Ls.flatten()

np.savetxt('brown_Ls.txt', np.column_stack([t, y]))

a, b = np.polyfit(t, y, 1) # solve x = at + b
a, _, _, _ = np.linalg.lstsq(t.reshape(-1, 1), y, rcond=None) # Solve y = ax 

a = unc.ufloat(1.5828e-12, 1.373e-13) 

T = 21.3 + 273.15
R = 8.31451
Na = 6.02214076 * 1e23
nu = 0.9544 * 1e-3

r = 2*R*T / (6*np.pi*nu*Na*a)

d = np.array([[677, 456], [680, 461]]) * scale
d = np.linalg.norm(d[0] - d[1])
r_true = d / 2

print(r)
print(r_true)

Ls = Ls / Ls[0]

print(Ls)
print(np.average(Ls, axis=1))
