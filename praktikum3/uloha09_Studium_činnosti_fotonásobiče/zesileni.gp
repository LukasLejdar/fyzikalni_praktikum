set ylabel "M $ \\cdot 10^6 $ "
set xlabel "U (V)"

phi1 = 0.90 * 1e-4
phi3 = 0.52 * 1e-4
phi5 = 0.34 * 1e-4

set term epslatex size 3.7,2.5
set output "M.tex"

plot "1.txt" u 1:( ($3/$2)**7 * 1e-6 ) lc 1 lt 7 t "", \
"3.txt" u 1:( ($3/$2)**7 * 1e-6 ) lc 3 lt 7 t "", \
"5.txt" u 1:( ($3/$2)**7 * 1e-6 ) lc 5 lt 7 t "",

set ylabel "S  (A Lm$^{-1} $) "
set xlabel "U (V)"

set output "S.tex"

plot "1.txt" u 1:( $4/phi1 ) lc 1 lt 7 t "", \
"3.txt" u 1:( $4/phi3 ) lc 3 lt 7 t "", \
"5.txt" u 1:( $4/phi5 ) lc 5 lt 7 t ""
