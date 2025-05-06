set ylabel "I (a.u.)"
set xlabel "$\\lambda$ (nm)" offset 0,-3
set xtics rotate by 90 offset 0,-3

set bmargin at screen 0.03
set term epslatex size 6.6,2.6
set output "fe7_data.tex"

set yrange [0:16000]

plot \
"Ze7_corrected.txt" u 1:2 w l lw 1 lc 0 lt 7 t "", \
"fe7_spectral_lines.txt" u 1:7:xtic(1) lt 20 lc 1 t "", \
"fe7_spectral_lines.txt" u 1:7:(0):(-$7) with vectors nohead lt 1 lc 1 t ""



