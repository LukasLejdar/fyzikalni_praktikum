set ylabel "$ r_p^2 $ (mm$ ^2$)"
set xlabel "p"

set term epslatex size 3.5,2.2
set output "fabry.tex"

 # 14519

f = 0.05
d = 3e-3
Z = 6.0
n = 1.456

l = 643.8e-9

f(x) = a*x + b

set xtics 1,1,5



fit f(x) "fabry2.txt" u 1:($2**2) via a, b

l = 508.588e-9

print( (f*Z)**2*n*l/d )



plot "fabry2.txt" u 1:($2**2 * 1e6) lc 6 lt 7 t "", f(x)*1e6 t "fit $ ax + b $"

