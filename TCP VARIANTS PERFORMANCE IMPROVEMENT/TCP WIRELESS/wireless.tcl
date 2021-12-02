set val(chan)           Channel/WirelessChannel    ;
set val(prop)           Propagation/TwoRayGround   ;
set val(netif)          Phy/WirelessPhy            ;
set val(mac)            Mac/802_11                 ;
set val(ifq)            Queue/DropTail/PriQueue    ;
set val(ll)             LL                         ;
set val(ant)            Antenna/OmniAntenna        ;
set val(ifqlen)         50                         ;
set val(nn)             6                          ;
set val(rp)             AODV                       ;
set val(x)  500   ;
set val(y)  500   ;


set ns [new Simulator]
set tracefile [open wireless.tr w]
$ns trace-all $tracefile

set namfile [open wireless.nam w]
$ns namtrace-all-wireless $namfile $val(x) $val(y)

set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

set channel1 [new $val(chan)]

$ns node-config -adhocRouting $val(rp) \
   -energyModel "EnergyModel" \
   -initialEnergy 3.0 \
   -txPower 0.9 \
   -rxPower 0.5 \
   -idlePower 0.45 \
   -sleepPower 0.05 \
  -llType $val(ll) \
  -macType $val(mac) \
  -ifqType $val(ifq) \
  -ifqLen $val(ifqlen) \
  -antType $val(ant) \
  -propType $val(prop) \
  -phyType $val(netif) \
  -topoInstance $topo \
  -agentTrace ON \
  -macTrace ON \
  -routerTrace ON \
  -movementTrace ON \
  -channel $channel1 

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

$n0 random-motion 0
$n1 random-motion 0
$n2 random-motion 0
$n3 random-motion 0
$n4 random-motion 0
$n5 random-motion 0

$n0 set X_ 460.0
$n0 set Y_ 390.0

$n1 set X_ 490.0
$n1 set Y_ 460.0

$n2 set X_ 50.0
$n2 set Y_ 400.0

$n3 set X_ 80.0
$n3 set Y_ 350.0

$n4 set X_ 350.0
$n4 set Y_ 320.0

$n5 set X_ 390.0
$n5 set Y_ 420.0

$ns initial_node_pos $n0 200 
$ns initial_node_pos $n1 80
$ns initial_node_pos $n2 160
$ns initial_node_pos $n3 80
$ns initial_node_pos $n4 120
$ns initial_node_pos $n5 120

$ns at 1.0 "$n1 setdest 490.0 340.0 25.0"
$ns at 1.0 "$n4 setdest 300.0 130.0 5.0"
$ns at 1.0 "$n5 setdest 190.0 440.0 15.0"
$ns at 20.0 "$n5 setdest 100.0 200.0 30.0"

set tcp [new Agent/TCP]
set sink [new Agent/TCPSink]
$ns attach-agent $n0 $tcp
$ns attach-agent $n5 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp

$ns at 1.0 "$ftp start"

set udp [new Agent/UDP]
set null [new Agent/Null]
$ns attach-agent $n2 $udp
$ns attach-agent $n3 $null
$ns connect $udp $null
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$ns at 0.5 "$cbr start"

$ns at 30.0 "finish"

proc finish {} {
 global ns tracefile namfile
 $ns flush-trace
 close $tracefile
 close $namfile
 exec nam wireless.nam &
 exit 0
}

puts "Starting Simulation"
$ns run
