import numpy as np
import scipy.stats as stats

data = np.loadtxt('prima_metoda.txt')

a =  data[:, 0] - data[:, 1]
a_ = data[:, 2] - data[:, 1]
f = a * a_ / (a - a_)


sem = np.std(f, ddof=1) / np.sqrt(len(f))
coef = stats.t.ppf((1 + 0.9973) / 2, len(f) - 1)

print(a)
print(a_)
print(np.mean(f), sem * coef)



