set ylabel ""
set xlabel ""

K = 66 * 1e-8

v = 0.02
d = 0.227

r1(x) = (x**2 + v**2)**0.5
r2(x) = ((d-x)**2 + v**2)**0.5

alpha(x) = acos(x/r1(x))
beta(x) = acos((d - x)/r2(x))

c(x) = cos(alpha(x))*cos(beta(x)) / ( r1(x)**2 * r2(x)**2 * sin( (alpha(x) + beta(x))/2 )**4 )

n(x) = K * c(x)

f(x) = K*x

fit n(x) "data.txt" u 1:($3/$2) via K

set xlabel "$f$ (cm)"
set ylabel "$n$ (s$^{-1}$)"

set term epslatex size 3.7,2.5
set output "data.tex"


set yrange [0:0.5]
set xrange [0:22.7]

plot "data.txt" u ($1*100.0):($3/$2) lc -1 lt 7 t "", n(x/100) t ""


set xlabel "$\\omega \\cdot 10^6$ (m$^{-4}$)"

set term epslatex size 3.7,2.5
set output "cetnost.tex"
unset xrange

plot "data.txt" u ($4*1e-6):($3/$2) lc -1 lt 7 t "", f(x*1e6) lc 7 t "fit"

print( ( 0.5 ) / c(d/2) )
print(c(d/2))
