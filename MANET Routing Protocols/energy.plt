set terminal png
set output "energy.png"
set datafile separator ","
set title "AODV vs DSDV vs DSR Routing Protocols "
set xlabel "Time (Seconds)"
set ylabel "Residual Energy"
plot "energy.csv"  using 1:2 with linespoints title "AODV", "energy.csv" using 1:3 with linespoints title "DSR", "energy.csv" using 1:4 with linespoints title "DSDV"
