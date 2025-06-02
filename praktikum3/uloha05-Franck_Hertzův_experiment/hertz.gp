set ylabel "$ U_a $ (V)"
set xlabel "$ U_2 $ (V)"

f1(x) = a1*x**4 + b1*x**3 + c1*x**2 + d1*x + e1
f2(x) = c2*x**2 + d2*x + e2
f3(x) = c3*x**2 + d3*x + e3

fit [11:22] f1(x) "mereni.txt" u 1:2 via a1, b1, c1, d1, e1
fit [36:41] f2(x) "mereni.txt" u 1:2 via c2, d2, e2
fit [56:62] f3(x) "mereni.txt" u 1:2 via c3, d3, e3

set dummy x
set table $f1_data; plot [11:22] f1(x); unset table
set table $f2_data; plot [36:41] f2(x); unset table;
set table $f3_data; plot [56:62] f3(x); unset table;

# Get maximum y-values
stats $f1_data u 1:2 name "f1"
stats $f2_data u 1:2 name "f2"
stats $f3_data u 1:2 name "f3"

set print "peaks.txt"
print "# Function   x_max   y_max"
print sprintf("%f   %f", f1_max_x, f1_max_y)
print sprintf("%f   %f", f2_max_x, f2_max_y)
print sprintf("%f   %f", f3_max_x, f3_max_y)
set print

set term epslatex size 3.7,2.5
set output "mereni.tex"

plot "mereni.txt" u 1:2 lc -1 lt 7 t "", \
[15:22] f1(x) lc 7 t "fit", \
[37:41] f2(x) lc 7 t "", \
[56:62] f3(x) lc 7 t ""


set xlabel "Násobnost maxima"
set ylabel "$ U_2 $ (V)"

set key at graph 0.6, 0.94

U1 = 2.36
U3 = 9.91

r = 0.20

f(x) = a*x + b
fit f(x) "peaks.txt" u ($0 + 1):($1) via a, b

set xrange [0.8:3.2]
set ytics 20,10,70
set xtics 1,1,3

set output "peaks.tex"
plot "peaks.txt" u ($0 + 1):($1) lc -1 t "", f(x) lc 7 t "fit $ \\Delta U_2 x + U_{20} $"

