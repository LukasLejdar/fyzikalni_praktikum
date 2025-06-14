set ylabel "M $ \\cdot 10^6 $ "
set xlabel "$U_n$ (V)"

phi1 = 0.90 * 1e-4
phi3 = 0.52 * 1e-4
phi5 = 0.34 * 1e-4

set key top left
set key spacing 1
set key samplen 1.5

set term epslatex size 3.5,2.3
set output "M.tex"

plot "1.txt" u 1:( $5**14 * 1e-6 ) lc 1 lt 7 t "poloha 1", \
"3.txt" u 1:( $5**14 * 1e-6 ) lc 3 lt 7 t "poloha 3", \
"5.txt" u 1:( $5**14 * 1e-6 ) lc 5 lt 7 t "poloha 5",

set ylabel "S  (A Lm$^{-1} $) "
set xlabel "$U_n$ (V)"

set output "S.tex"

plot "1.txt" u 1:( $4/phi1 ) lc 1 lt 7 t "poloha 1", \
"3.txt" u 1:( $4/phi3 ) lc 3 lt 7 t "poloha 3", \
"5.txt" u 1:( $4/phi5 ) lc 5 lt 7 t "poloha 5"
