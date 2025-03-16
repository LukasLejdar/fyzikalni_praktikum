set ylabel "D"
set xlabel " $\\lambda \\ \\mu m $"

a = 0
b = 0
c = 0
d = 0
e = 0

f(x) = a*x**4 + b*x**3 + c*x**2 + d*x + e

fit f(x) "cejchovani.txt" u 1:2 via a, b, c, d, e

set tmargin at screen 0.85
set term epslatex size 3.2,2.0
set output "cejchovani.tex"

set xrange [0.9:2]

plot "cejchovani.txt" u 1:2 lc -1 lt 7 t "", f(x) lc 1 t "fit"

print(f(1))
