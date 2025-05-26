set ylabel "$ U $ (mV) "
set xlabel " $\\lambda \\ \\mu m $"

set term epslatex size 3.5,2.2
set output "germanium.tex"

plot "germanium.txt" u 1:2 w lp lc -1 lt 7 t ""


a = -325.625
b = 1289.32
c = -1777.45
d = 970.051

f(x) = a*x**3 + b*x**2 + c*x + d

h = 6.6260 * 1e-34
cl = 299792458
eV = 1.602176634 * 1e-19


set ylabel "$ S \\cdot 10^{-6} $ "
set xlabel "$ E $ (eV)"
set output "germanium_S.tex"
plot [0.65:1.6] "germanium.txt" u (h*cl/($1*1e-6*eV)):($2*1e-3*0.3*1e6/f($1)) w lp lc -1 lt 7 t ""
