import numpy as np
import scipy.stats as stats

data = np.loadtxt('pricne_zvetseni.txt')

a =  data[:, 0] - data[:, 1]
a_ = data[:, 2] - data[:, 1]
y_ = data[:, 3]
y = -0.05
B = y_ / y

fB1 = a * B / (1 - B)
fB2 = a_ / (1 - B)
fp = a * a_ / (a - a_)

print(a)
print(a_)
print(y)
print(y_)
print(fB2)
print(fB1)
print(fp)

sem = np.std(fB1, ddof=1) / np.sqrt(len(fB1))
coef = stats.t.ppf((1 + 0.9973) / 2, len(fB1) - 1)
print('fB1', np.mean(fB1), sem * coef)

sem = np.std(fB2, ddof=1) / np.sqrt(len(fB2))
coef = stats.t.ppf((1 + 0.9973) / 2, len(fB2) - 1)
print('fB2', np.mean(fB2), sem * coef)

sem = np.std(fp, ddof=1) / np.sqrt(len(fp))
coef = stats.t.ppf((1 + 0.9973) / 2, len(fp) - 1)
print('fp', np.mean(fp), sem * coef)




