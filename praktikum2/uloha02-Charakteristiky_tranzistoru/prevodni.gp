set ylabel "$I_D$ (mA)"
set xlabel "$U_G$ (V)"

set yrange [-5:60]

set bmargin at screen 0.03
set term epslatex size 3.5,2.0
set output "prevodni_10V.tex"

set label "" at 3.6,7.0627 point lt 7 lc 6 offset -3,1.5
set label "$p$" at 3.6,7.0627 point pt 2 ps 1.5 lw 3 lc rgb "red" offset -1.9,0.8

f(x) = 1e3 * (x*S + b)
fit [3.54:3.66] f(x) "charakteristiky/prevodni10V.dat" u 1:2 via S, b

plot "prevodni_10V.txt" u 1:2 lc 6 lt 7 t ""


