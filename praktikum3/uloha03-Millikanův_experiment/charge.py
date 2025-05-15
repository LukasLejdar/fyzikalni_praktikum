import numpy as np
import scipy.stats as stats
import uncertainties as unc

def average(arr):
    sem = np.std(arr, ddof=1) / np.sqrt(len(arr))
    coef = stats.t.ppf((1 + 0.99) / 2, len(arr) - 1)
    return unc.ufloat(np.mean(arr), sem*coef)

# Load the data
data = np.loadtxt('charges.txt')
charge = data[:, 0] / data[:, 1]

print(average(charge))
