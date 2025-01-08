
set xlabel "x (cm)"
set ylabel "y (cm)"
set grid

set palette model RGB defined ( \
    0 "red", \
    1 "orange", \
    2 "yellow", \
    3 "green", \
    4 "cyan", \
    5 "blue", \
    6 "purple", \
    7 "#800080" \
)

array r[8]
array y0[8]
stats "ekvi-pot-kruhy.txt" u (y0[int($0+1)] = $1) nooutput
stats "ekvi-pot-kruhy.txt" u (r[int($0+1)] = $2) nooutput

set cbrange [0:7]
set colorbox
set cbtics ("1.5 V" 0, "2.0 V" 1, "2.3 V" 2, "2.5 V" 3, "2.7 V" 4, "3.0 V" 5, "3.3 V" 6, "4.0 V" 7)

set xrange [-20:20]
set yrange [-25:25]
set ytics 5
set clip
set samples 10000
set size ratio -1

set bmargin at screen 0.03
set term epslatex size 5,5.0
set output "plochy.tex"
set parametric

plot "plochy.dat" u 2:3:1 with points pt 7 ps 1 lc palette t "", \
    for [i=1:8] [0:2*pi] r[i]*sin(t), r[i]*cos(t) + y0[i] lc rgb "gray" t ""


