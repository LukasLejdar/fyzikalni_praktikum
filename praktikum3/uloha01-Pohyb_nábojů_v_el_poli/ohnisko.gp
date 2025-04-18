set ylabel ""
set xlabel "$ I $"

f(x) = a*x

fit f(x) "ohnisko.txt" u ($2)**2:1 via a

set term epslatex size 3.7,2.5
set output "ohnisko.tex"

plot "ohnisko.txt" u ($2)**2:1 lc -1 lt 7 t "", f(x) lc 7 t "fit"

print(a * 98 * 0.02 / 1000**2)
