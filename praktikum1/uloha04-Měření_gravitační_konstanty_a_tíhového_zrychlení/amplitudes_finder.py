import numpy as np
import sys

assert(len(sys.argv) > 1)

window = 5
values = np.loadtxt(sys.argv[1])
values = np.delete(values, np.s_[values.shape[0] // window * window:], axis=0)
values = values.reshape(-1 , window, 2)
values = np.roll(values, window//2, axis=1)
values = values[np.arange(values.shape[0])[:, None], np.argsort(values[..., 1])]
values = np.delete(values, np.s_[1:-1], axis=1).reshape(-1, 2)
values = values[values[:, 0].argsort()]

x = values[:, 0]
y = values[:, 1]

mask = (y[0:-2] < y[1:-1]) & (y[1:-1] >= y[2:]) | (y[0:-2] > y[1:-1]) & (y[1:-1] <= y[2:])
amplitudes = np.hstack((x[1:-1][mask][:, np.newaxis], y[1:-1][mask][:, np.newaxis]))

print('metda tří kmitů', 0.5*(0.5*(amplitudes[:-2, 1] + amplitudes[2:, 1]) + amplitudes[1:-1, 1]))
print('periody', (amplitudes[2:, 0] - amplitudes[:-2, 0]) )
np.savetxt('amplitudes.txt', amplitudes, delimiter=' ')
