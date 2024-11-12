import numpy as np
import scipy.stats as stats
import uncertainties as unc

def average(arr):
    sem = np.std(arr, ddof=1) / np.sqrt(len(arr))
    #coef = stats.t.ppf((1 + 0.9973) / 2, len(arr) - 1)
    return unc.ufloat(np.mean(arr), sem)

data = np.loadtxt('roztoky.txt')
averages = [average(data[:, col]) for col in range(data.shape[1])]
averages = np.array(averages).reshape(4, 3)

_alph_ = (averages[:3, 2] - averages[3, 2]) / ( 1 * 0.01 * (averages[:3, 0]- averages[3, 0]))
print(_alph_)
print(np.mean(_alph_))

