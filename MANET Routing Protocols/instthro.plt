set terminal png
set output "instthro.png"
set datafile separator ","
set title "AODV vs DSDV vs DSR Routing Protocols "
set xlabel "Time (Seconds)"
set ylabel "Instant throughput"
plot "instthro.csv"  using 1:2 with linespoints title "AODV", "instthro.csv" using 1:3 with linespoints title "DSR", "instthro.csv" using 1:4 with linespoints title "DSDV"
