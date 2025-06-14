set ylabel "$ \\sigma $"
set xlabel "$ \\Phi $ ($\\mu$Lm)"

set key at graph 0.95, 0.6
set key spacing 1
set key samplen 1.5

set term epslatex size 3.5,2.3
set output "sigma_na_phi.tex"

set yrange [3.1:3.8]
set xrange [10:100]

plot "650V.txt" u ($2 * 1e6):( $6 ) lc 1 lt 7 t "$U_n = 650$V", \
"750V.txt" u ($2 * 1e6):( $6 ) lc 2 lt 7 t "$U_n = 750$V"
