set term epslatex size 4.4,2.5
set output "charges.tex"

set xlabel ""

set xrange [0:62]
set yrange [0:7]

set palette defined (\
  0 "#440154", \
  1 "#482777", \
  2 "#3E4989", \
  3 "#31688E", \
  4 "#26828E", \
  5 "#1F9E89", \
  6 "#35B779", \
  7 "#6DCD59", \
  8 "#B4DE2C", \
  9 "#FDE725")

set cblabel "Napětí"
set colorbox

# Plot using 2nd column for color (voltage)
plot "all_charges.txt" using ($0 + 1):($1 * 1e19):2 with points pt 7 ps 1 palette notitle

