
set xlabel "t [s]"
set ylabel "$U [V]$"
set datafile separator ","


Ui = -6
Uf = 6
x0 = -0.00001
xf = 0.015
l = 6000
f(x) = (Ui - Uf)*(1 + l*(x - x0))*exp(-l*(x - x0)) + Uf
fit [x0:xf] f(x) "kriticke_1200Ohm.csv" u 1:2 via Ui, Uf, l

set tmargin at screen 0.89
set bmargin at screen 0.11
set lmargin at screen 0.06
set rmargin at screen 0.94

set xtics 0.005
set samples 1000
set bmargin at screen 0.07
set term epslatex size 3.1,2.1
set output "kriticke.tex"
plot [0:xf] "kriticke_1200Ohm.csv" u 1:2 ps 0.4 lc 6 lt 7 t "", [0:xf] f(x) lt -1 t "fit" 

L = 0.113
R = l * 2 * L 
print(R)
