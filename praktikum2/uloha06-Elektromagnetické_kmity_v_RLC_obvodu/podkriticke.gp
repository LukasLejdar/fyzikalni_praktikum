
set xlabel "t [s]"
set ylabel "U [V]"
set datafile separator ","

Ui = -6.13065
Uf = 5.9497
xf = 0.015
UC = 10
phi = pi * 3 / 2
a = 200
w0 = 5000

f(x) = (Ui - Uf) * exp(-a*x)*cos(sqrt(w0**2 - a**2)*x + phi) + Uf
fit [0:xf] f(x) "podkriticke_20Ohm.csv" u 1:2 via a, w0, phi, Ui, Uf

set tmargin at screen 0.89
set bmargin at screen 0.11
set lmargin at screen 0.06
set rmargin at screen 0.94

set xtics 0.005
set samples 1000
set term epslatex size 3.1,2.1
set output "podkriticke.tex"
plot [0:xf] "podkriticke_20Ohm.csv" u 1:2 ps 0.4 lc 6 lt 7 t "", [0:xf] f(x) lt -1 t "fit" 

print(sqrt(w0**2 - a**2))
