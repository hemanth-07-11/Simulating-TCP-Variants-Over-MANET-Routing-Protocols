# Simulating-TCP-Variants-over-MANET-Routing-Protocols

Repository for final submission of project work done as a part of Networks course. 
# Group Members
- HEMANTH N
- RAMYAA P
- SUDHARSAN GV

## Basic Idea
In our comparison model, we simulated the wireless net-work topology for 50nodes and we have analyzed the results carefully which indicate DSDV achieves least End to End Delay while used with any TCP variant, and that AODV with Vegas, DSDV with Reno perform well on respective parameters.  
The proposed model which we have named Hybrid Reno aims to serve the primary purpose of the achievement of data transmission appropriately implementing congestion control with the medium of a MANET of the cross-layer type.  and results, it is inferred that in data link layer, there would be packet traffic since a shared channel is used.

## Tools used

- NS2
- NS3
- NAM
- GNUPLOT

## Analysis and Results
A wireless network is simulated, where the nodes keep moving randomly with TCP flows on the simulation topology. Throughout the simulation, every node starts from a random source and moves to a random chosen destination. Once the destination is reached, the node takes a rest of your time in seconds and another random destination is chosen subsequently pause time. TCL Scripts are written to simulate the networks and AWK scripts are written to analyze the results from trace files. <br><br>
Based on our simulations results , we have tabulated the conclusion on comparison of MANET based on packet delivery ratio and end to end delay in the report pdf. It is observed that TCP Vegas has best performance under AODV in terms of both packet delivery ratio and end to end delay. It is also observed that TCP SACK1 has the least performance under all routing protocol with respect to both metrics.<br><br>
Following a thorough analysis of the performance of the established variants of TCP, TCP Vegas was found to outperform its peers especially in the metrics of average throughput as well as average delay instant throughput. From the experimental simulations we have concluded that TCP Reno outperforms other variants under DSDV routing protocol based on the end-to-end delay comparison, TCP Vegas was found to outperform the other variants when used in conjunction with the AODV routing protocol when packet delivery rate was considered as the main metric. <br><br>
We attempted the fabrication of a TCP variant created following the modification of a set of palpable properties over the implementation of a decision making technique utilizing RTT. In the case that a packet was lost as a result of contention issues, reduction in transmission rate was warranted for a period of time in order to influence a reduction in channel contention. However, we have achieved an approximate 15 percent improvement in performance with respect to end to end delay.<br><br>
