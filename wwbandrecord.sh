#!/bin/bash
#
# Last mod 2023-01-09, by VU3ZAN Sunil Aruldas
# Bash file 'wwbandrecord.sh' for recovering and recording the band name and time for 
# activation of fixed and rotating bands in the utility environment for  ~/rtlsdr-wsprd/rtlsdr_wsprd
# NOTE: rtlsdr_wsprd is a WSPR daemon by Guenael VA2GKA on Github. RESPECT!!

# This script, located in ~/wsprd, is called by all the fixed and rotating band scripts, 
# since the coding is common for all.
# Variables 'this_band' and 'this_script' have been passed from each calling band script, 
# referring to the current band of WSPR operation and the name of the band script used.

# recovering description of previous band
    echo $'\n'"----------------------------------------------" >> ~/wsprd/wlogs/wsprd.log 
    prevfile="$HOME/wsprd/wlogs/wsprband.txt"
    # In the above line the tilde ~ is replaced by $HOME for use in the variable
    while read -r prev_item
    do
        # writing description of previous band to wsprd.log
        echo "$prev_item" >> ~/wsprd/wlogs/wsprd.log 
        # Next checking if it is day begin, and if so setting a flag to be used later in this script
	curr_status=""
        If 
            [ "$prev_item" == "NEW LOG FILE NOW OPENED" ]
        Then 
            curr_status="DAYBEGIN"
        fi
    done < "$prevfile"
    
# recovering time of activation of previous band
    prevfile="$HOME/wsprd/wlogs/wsprbandtime.txt"
    while read -r prev_item
    do
        # writing time of activation of previous band to wsprd.log
        echo "$prev_item" >> ~/wsprd/wlogs/wsprd.log 
    done < "$prevfile"

 # NOTE: The running rtlsdr_wsprd session for previous band needs to be killed before a new session can be created 
 # for the current band. Since this causes it to dump all records of previous band to the wsprd.log file, the activation time 
 # and name of previous band need to be written to the file first, which has been taken care of above.
 
# recording description of current ## band and the specific script being used for it. 
# This can be checked through the ~/bin/wwband script
    curr_band="Running reception on ""$this_band"" meters"  
    echo "$curr_band" > ~/wsprd/wlogs/wsprband.txt  
    curr_script="Using script : ""$this_script"
    echo "$curr_script" >> ~/wsprd/wlogs/wsprband.txt 
    
# recording time of current band activation for use when the next band is activated
    echo "$(date)" > ~/wsprd/wlogs/wsprbandtime.txt  
 
# ADDITONAL STEP for DAY BEGIN
# If the above variable curr_status has value "DAYBEGIN" then 
# the current band and time have to be written to log immediately so as to appear at the top, of it
# Now using above coding for uniformity

# recording description of current ## band and the specific script being used for it, 
# in the log if it is DAY BEGIN
   if
	[ "$curr_status" == "DAYBEGIN" ]
   then
   	echo "$curr_band" >> ~/wsprd/wlogs/wsprd.log
    	echo "$curr_script" >> ~/wsprd/wlogs/wsprd.log
	$curr_status=""
   fi
    
# recording time of current band activation at DAY BEGIN
    echo "$(date)" > ~/wsprd/wlogs/wsprd.log 


# end of file
