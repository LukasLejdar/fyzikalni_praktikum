set ylabel "$ I_a $ ($ \\mu $A)"
set xlabel "$ I_f $ (A)"

set term epslatex size 3.7,2.5


set output "vystupni_prace.tex"
plot "vystupni_prace.txt" u 2:($4*1e6) lc -1 lt 7 t ""


# teplota

k = 1.380649e-23
rho = 4.89e-8
d_S = 7.76e6
alpha = 4.83e-3

w = 6.75 * 1e-19
B = 2

T(x) = (x / (rho * d_S) - 1) / alpha + 273.15

f(x) = B * x**2 * exp( - w / (k*x) )

set ylabel " $ \\log(I_a/T^2) $ "
set xlabel " $ 1/T $ (K$^{-1} $) "

fit [1100:1400] log(f(x)) "vystupni_prace.txt" u (T($1/$2)):(log($4)) via w, B

set output "teplota.tex"
plot "vystupni_prace.txt" u (1/T($1/$2)):(log($4/(T($1/$2)**2))) lc -1 lt 7 t "", log(f(1/x)/( (1/x)**2)) lc 7 t "fit"


print "1.92", T(4.883779 / 1.925364)

print "1.98", T(5.143126 / 1.985696)

q = 1.60217663e-19

print "work function (eV)", w / q, w_err / q
