set ylabel "$ I_D $ (mA)"
set xlabel "$ U_D $ (V)"

set bmargin at screen 0.03
set term epslatex size 3.5,2.0
set output "vystupni_3V6.tex"

set xrange [-0.5:15]
set yrange [-1:10]

set label "" at 10,7.0627 point lt 7 lc 6 offset -3,1.5
set label "$p$" at 10,7.0627 point pt 2 ps 1.5 lw 3 lc rgb "red" offset -1.9,0.8

R = 19230
f(x) = 1e3 * (x/R + b)
fit [9:11] f(x) "charakteristiky/vystupni3V6.dat" u 1:2 via R, b

plot "vystupni_3V6.txt" u 1:2 lc 6 lt 7 t ""
