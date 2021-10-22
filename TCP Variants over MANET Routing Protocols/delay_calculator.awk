
BEGIN {
}
{
	if($1 == "s" && $4 == "AGT") {
		sent_time = $2;
	} 

	else if($1 == "r" && $4 == "AGT") {
                	
								receive_time= $2;
                end_to_end_delay = receive_time - sent_time;
                print $2 " " end_to_end_delay;
	}
}
END {
}
