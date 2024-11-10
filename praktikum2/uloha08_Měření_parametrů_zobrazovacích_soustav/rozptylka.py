import numpy as np
import scipy.stats as stats

data = np.loadtxt('rozptylka_prima_metoda.txt')

a_spoj = data[:, 0] - data[:, 1]
a_spoj_ = 1 / (1/0.16 + 1/a_spoj)
print("a_spoj_ pred ", a_spoj_ + data[:, 1])

A = data[:, 2]
R = data[:, 3]
A_ = data[:, 4]

a = A - R
a_ = A_ - R
f = a * a_ / (a - a_)

sem = np.std(f, ddof=1) / np.sqrt(len(f))
coef = stats.t.ppf((1 + 0.9973) / 2, len(f) - 1)

print(R)
print(A)
print(A_)
print(f)
print(np.mean(f), sem * coef)
