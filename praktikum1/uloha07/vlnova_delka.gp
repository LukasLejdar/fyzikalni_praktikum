set ylabel "l [cm]"
set yrange [0:140]

set xlabel "n-té měření"

set style data points

f5(x) = a5*x + b5
f4(x) = a4*x + b4
f3(x) = a3*x + b3
f2(x) = a2*x + b2

fit f5(x) "vlnova_delka5" u 1:(100-$2) via a5,b5
fit f4(x) "vlnova_delka4" u 1:(100-$2) via a4,b4
fit f3(x) "vlnova_delka3" u 1:(100-$2) via a3,b3
fit f2(x) "vlnova_delka2" u 1:(100-$2) via a2,b2

set term png size 800,400
set output "vlnova_delka.png"

# Define line styles
set style line 1 lt rgb "#000000" lw 1
set style line 2 lt rgb "#00ff00" lw 1  # Green
set style line 3 lt rgb "#0000ff" lw 1  # Blue
set style line 4 lt rgb "#ffa500" lw 1  # Orange
set style line 5 lt rgb "#800080" lw 1  # Purple

set label 1 sprintf("%.2f", a5) at graph 1.2, graph 0.9

plot \
  "vlnova_delka5" u 1:(100-$2) ls 1 title "", \
  "vlnova_delka4" u 1:(100-$2) ls 1 title "", \
  "vlnova_delka3" u 1:(100-$2) ls 1 title "", \
  "vlnova_delka2" u 1:(100-$2) ls 1 title "", \
  f2(x) ls 2 title "f = 1.56 kHz", \
  f3(x) ls 4 title "f = 1.89 kHz", \
  f5(x) ls 3 title "f = 3.41 kHz", \
  f4(x) ls 5 title "f = 5.04 kHz"
