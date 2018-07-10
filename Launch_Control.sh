# Runs The Following Files


./GPU_Settings.sh   # File to set OverClock GPU Values
gnome-terminal -- ./RunMiner.sh	# File to start making $$$		
gnome-terminal -- ./GPU_Stats_Monitor.sh 	# Monitor Expensive Shit
gnome-terminal -- ./Mining_Status.sh	# Monitor Expensive Shit



kill -9 $PPID	# Turn off initial Terminal if still running
