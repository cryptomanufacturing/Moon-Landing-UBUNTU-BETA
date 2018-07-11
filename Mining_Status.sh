# Made By Gary Bard 
# Absolutley free !!! Brought to you by HashPowerPool.com

#!/bin/bash

# Script checks to see if smartminer is running properly, if not restart the program!

FailThreshold=9 #This many seconds between 
MinerFailed=0 # Dont Touch This
MiningRam=1024 # Minimum Ram Operating lvl setting change this to fit your needs keep in miund this also depends on your overclock settings









while true; do 
	
sleep 1 # let the miner load the mem on the cards			 
	CurrentRam=$(nvidia-smi -i 0 --query-gpu=memory.used --format=csv| sed 's/[^0-9]*//g') # store current ram used for card #0 and Subtract anything thats not a number
		if [ "$CurrentRam" -lt "$MiningRam" ] # Check to see if GPU is using less than minimum ram req for operating lvl
			then
				 MinerFailed=$((MinerFailed+1)) # Threshold failed this many times +1
				echo "Miner Failed Threshold Test Failed $MinerFailed Times"
				
				clear
			else 
			( 		
				echo   "Makeing it Rain"		# WOOHOOOO
				clear				 		
			)
		fi
		if [ "$MinerFailed" -eq "$FailThreshold" ] # Check to see how many times the threshhold failed 
					then
					(
						echo   "Restarting Miner" # UGH CRAP
						killall -r --regexp SmartMiner.v3.1 # kill the miner
		 				gnome-terminal -- ./RunMiner.sh	# Restart The Miner
						
						exec bash Mining_Status.sh # Restart Script From the Top

				sleep 1
				
				
					)
		fi
		
done 

