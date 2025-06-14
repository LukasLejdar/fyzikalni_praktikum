set ylabel "$ B $ (T)"
set xlabel "$ I $ (A)"

B(x) = a*x**3 + b*x**2 + c*x + d

fit B(x) "pole.txt" u 1:2 via a, b, c, d

set term epslatex size 3.5,2.2
set output "pole.tex"

plot "pole.txt" u 1:2 lc -1 lt 7 t "", B(x) lc 7 t "fit"

a = 8.751485673928511e-24 
b = 5.152948526372981e-25

f(x) = a*x + b

fit f(x) "E.txt" u (B($1)):($2) via a, b

set ylabel "$ | \\Delta E | $ (J) "
set xlabel "$ B $ (mT)"

set yrange [2:6]

set term epslatex size 3.7,2.5
set output "magneton.tex"

set palette defined (0 "blue", 1 "green")

#set palette rgb 33,13,10


plot "E.txt" u (B($1)*1e3):($2*1e24) lt 7 lc -1 t "", f(x*1e-3)*1e24 lc 7 t "fit"
