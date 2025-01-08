set ylabel "$ I_D $ (mA)"
set xlabel "$ U_D $ (V)"

#set bmargin at screen 0.03
#set term epslatex size 4.5,2.5
#set output "charakteristiky.tex"

set yrange [-5:45]
set xrange [-1:18]

E = 20
Rz = 1360
f(x) = 1e3 * (E - x) / Rz

set key right
set key offset 0,-1.7 
set label "$(U_{D0}, U_{G0})$" at 10,7.0627 point pt 2 ps 1.5 lw 5 lc rgb "red" offset -3,1.5

plot \
"charakteristiky/vystupni3V8.dat" u 1:2 w l lw 4 lc 1 lt 7 t "$U_G = 3.8$ V", \
"charakteristiky/vystupni3V7.dat" u 1:2 w l lw 4 lc 2 lt 7 t "$U_G = 3.7$ V", \
"charakteristiky/vystupni3V6.dat" u 1:2 w l lw 4 lc 3 lt 7 t "$U_G = 3.6$ V", \
"charakteristiky/vystupni3V5.dat" u 1:2 w l lw 4 lc 4 lt 7 t "$U_G = 3.5$ V", \
"charakteristiky/vystupni3V4.dat" u 1:2 w l lw 4 lc 5 lt 7 t "$U_G = 3.4$ V", \
f(x) lc 0 lt 0 dt 2 lw 6 t ""

pause -1
