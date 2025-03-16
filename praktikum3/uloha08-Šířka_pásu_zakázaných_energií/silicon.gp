set ylabel "$ U $ (mV) "
set xlabel "$ \\lambda $ $ \\mu m $ "

set term epslatex size 3.5,2.2
set output "silicon.tex"

plot "silicon.txt" u 1:($2*0.3) w lp lc -1 lt 7 t ""


a = 412.832 
b = -2716.62
c = 6400.23 
d = -6552.69
e = 2614.67 

f(x) = a*x**4 + b*x**3 + c*x**2 + d*x + e

h = 6.6260 * 1e-34
c = 299792458
eV = 1.602176634 * 1e-19


set ylabel "S"
set xlabel "E (eV)"
set output "silicon_S.tex"
plot "silicon.txt" u (h*c/($1*1e-6*eV)):($2*1e9/f($1)) w lp lc -1 lt 7 t ""

print(f(1))
