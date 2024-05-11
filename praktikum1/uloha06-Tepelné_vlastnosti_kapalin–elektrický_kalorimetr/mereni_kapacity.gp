set ylabel "T ($^{\\circ}$C)"
set xlabel "t (s)"

set yrange [20:45]
set ytics 20,5,45

plot \
"mereni_kapacity.txt" u 1:2 w l t "1", \
"mereni_kapacity.txt" u 1:3 w l t "2", \
"mereni_kapacity.txt" u 1:4 w l t "2", \
"mereni_kapacity.txt" u 1:5 w l t "2", \

pause -1
