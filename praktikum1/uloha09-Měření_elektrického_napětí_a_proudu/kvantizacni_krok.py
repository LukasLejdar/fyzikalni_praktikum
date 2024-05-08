import pandas as pd
import numpy as np

table = pd.read_csv('kvantizacni-krok.txt', sep=' ', header=None)
values = np.array(table[2])
deltas = np.abs(values[1:] - values[:-1])
deltas = deltas[deltas != 0]

print(np.min(deltas))





