
system("python -c \"\
import numpy as np; \
import pandas as pd; \
values = pd.read_csv('cavendish.txt', sep=' ', header=None); \
x = np.array(values[1]); \
y = np.array(values[2]); \
print(y); \
mask = (y[0:-2] < y[1:-1]) & (y[1:-1] > y[2:]) | (y[0:-2] > y[1:-1]) & (y[1:-1] < y[2:]); \
amplitudes = np.hstack((x[1:-1][mask][:, np.newaxis], y[1:-1][mask][:, np.newaxis])); \
np.savetxt('amplitudes.txt', amplitudes, delimiter=' '); \
\" ")

set bmargin at screen 0.03
set term epslatex size 5.8,2.5
set output "cavendish.tex"

f = 918.0

set xrange [0:32] 
set yrange [0.8:1.2]
set ytics 0.8, 0.1, 1.2

set xlabel "T (min)"
set ylabel "x (m)"

phi0 = 1.025
phi1 = 0.883

set label "$x_0 = 1.025\\ m$" at 26,phi0
set label "$x_0' = 0.883\\ m$" at 26,phi1

plot \
"cavendish.txt" u (0 < $1 && $1 < 153 ? $1*10/60 : 1/0):($2 / f) t "", \
"amplitudes.txt" u (0 < $1 && $1 < 150 ? $1*10/60 : 1/0):($2 / f) ps 1.5 lt 7 lc 2 t "", \
[0:25.5] phi0 lw 5 lt 0 t "", \
[0:25.5] phi1 lw 5 lt 0 t ""



