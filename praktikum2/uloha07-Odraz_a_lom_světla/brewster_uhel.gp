
set angles degrees
set ylabel "U (mV)"
set xlabel "úhel dopadu $\\varphi$ (°)"
set samples 1000

set tmargin at screen 0.95 
set bmargin at screen 0.20
set lmargin at screen 0.05
set rmargin at screen 0.95

U = 100
n = 1.49 

set label "$(\\varphi_B, 0.032)$" at 56,0.032 point pt 2 ps 1.5 lc rgb "red" offset -3,1.5

set term epslatex size 3,2.6
set output "brewster_uhel.tex"
plot "brewster_uhel.txt" u 1:($2) ps 1 lc 6 lt 7 t ""
