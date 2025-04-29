set xlabel "$ I_f^2 $ (mA)"
set ylabel "$ U_a (V) $"

f(x) = a*x

r = 0.02
n = 1000

fit f(x) "ohnisko.txt" u ($2)**2:1 via a

set term epslatex size 3.7,2.5
set output "ohnisko.tex"

plot "ohnisko.txt" u ($2**2 * 1e3):1 lc -1 lt 7 t "", f(x*1e-3) lc 7 t "fit"

print(a)
