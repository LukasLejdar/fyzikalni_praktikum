set xlabel "$ \\omega $ (Hz)"
set ylabel "$ A_u $"

CF = 10e-9
RF = 100e3
RA = 10e3

f(w) = - U1 * (RF/RA) /( 1 + (2*pi*w*CF*RF)**2 )**0.5

fit f(x) "dolnofrekvencni_propust.txt" u 1:2 via U1

set term epslatex size 3.4,2.5
set output "dolnofrekvencni_propust.tex"

set key at screen 0.62, 0.83


plot "dolnofrekvencni_propust.txt" u 1:2 lc -1 lt 7 t "", f(x) lc 6 t "teoretická \n závislost"
