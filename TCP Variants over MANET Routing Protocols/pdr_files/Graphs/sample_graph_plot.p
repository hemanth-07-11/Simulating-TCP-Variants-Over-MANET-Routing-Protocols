set terminal png 
set output "graph.png"
set title "Comparative analysis of PDR"
set xlabel "Time(Seconds) "
set ylabel "packet Drop ratio"
set grid
set xrange [0:50]
set yrange [0:100]


plot "AODV_Reno.csv"  every :50 with lines title "AODV Reno" , "AODV_Fack.csv"  every :50  with lines title "AODV Fack" ,"AODV_Linux.csv" every :50 with lines title "AODV Linux" ,"AODV_Sack1.csv" every :50 with lines title "AODV Sack1" ,"AODV_Newreno.csv" with lines title "AODV NewReno" ,"DSR_Fack.csv" with lines title "DSR Fack" ,"DSR_Sack1.csv" with lines title "DSR SACK1" ,"DSR_Newreno.csv" with lines title "DSR NewReno" ,"DSDV_Reno.csv" with lines title "DSDV Reno" , "DSDV_Fack.csv" with lines title "DSDV Fack" ,"DSDV_Linux.csv" with lines title "DSDV Linux" ,"DSDV_Sack1.csv" with lines title "DSDV Sack1" ,"DSDV_Newreno.csv" with lines title "DSDV New Reno" 
set term pngcairo size 1920,1080 
set output "graph.png"
replot
