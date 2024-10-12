
set xlabel "t [s]"
set ylabel "U [V]"
set yrange [-8:8]
set datafile separator ","

Ui = -6.13065
Uf = 5.9497
w0 = 6366.7
a = 8000
phi = 1.2
C1 = -6

f(x) = C1 * sinh(sqrt(a**2 - w0**2)*x + phi ) * exp(-a*x) + Uf
fit [0:0.015] f(x) "nadkriticke_5000Ohm.csv" u 1:2 via a, phi, C1

set tmargin at screen 0.89
set bmargin at screen 0.11
set lmargin at screen 0.06
set rmargin at screen 0.94

set xtics 0.005
set samples 1000
set bmargin at screen 0.07
set term epslatex size 3.1,2.1
set output "nadkriticke.tex"
plot [0:0.015] "nadkriticke_5000Ohm.csv" u 1:2 ps 0.4 lc 6 lt 7 t "", [0:0.015] f(x) lt -1 t "fit" 

#L = 0.113
#C = 217 * 1e-9
#R = -L * (1/(L*C) + l1*l1) / l1
#
#print(R)
