import pandas as pd
import math
import numpy as np
import uncertainties as unc
import os
import scipy.stats as stats


def calculate(liquid_kind):
    max = []
    for file_name in os.listdir('krouzek_' + liquid_kind):
        with open(os.path.join('krouzek_' + liquid_kind, file_name)) as file:
            for _ in range(3):
                next(file)
            data = np.loadtxt(file)
            max.append(np.max(data[:, 1]))

    k = stats.t.ppf(0.5 + 0.9973 / 2, df=len(max)-1)
    Fmax = unc.ufloat(np.mean(max), np.std(max, ddof=1) / math.sqrt(len(max)) * k)
    R = unc.ufloat(58.0, 0.1) * 0.001 / 2.0
    f = 0.77
    s = Fmax * f / (4 * math.pi * R)

    print(liquid_kind, 'Fmax', Fmax, 'sigma', s)
    print(R)

calculate('lih')
calculate('voda')



#def S(Fmax):
#    f = 0.77
#    R = unc.ufloat(58.0, 0.1) * 0.001 / 2.0
#    Fmax = unc.ufloat(np.mean(Fmax), np.var(Fmax, ddof=1) / math.sqrt(len(Fmax)))
#    return Fmax * f / (4 * math.pi * R)
#
#table = np.loadtxt('nouyho-krouzek.txt')
#print('lih', S(table[:, 0]))
#print('voda', S(table[:, 1]))
