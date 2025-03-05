set ylabel "I (a.u.)"
set xlabel "$\\lambda$ (nm)" offset 0,-3

set bmargin at screen 0.03
set term epslatex size 6.6,2.6
set output "OH7_data.tex"

set format x "%.3f"
set xrange [306:312]
set xtics rotate by 90 offset 0,-3 0,100,4000
set xtics add (306, 307, 309, 310, 311, 312)

plot \
"OH7_corrected.txt" u 1:2 w l lw 1 lc 6 lt 7 t "", \
"OH7_spectral_lines.txt" u 3:6:xtic(4) lt 20 lc 1 t ""
