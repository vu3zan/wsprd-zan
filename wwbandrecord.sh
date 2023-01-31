#!/bin/bash
#
# Last mod 2023-01-26, by VU3*ZAN Sunil Aruldas
# Bash file 'wwbandrecord.sh' for recovering and recording the band name and time for
# activation of fixed and rotating bands in the utility environment for  ~/rtlsdr-wsprd/rtlsdr_wsprd
# NOTE: rtlsdr_wsprd is a WSPR daemon by Guenael VA2GKA on Github. RESPECT!!

# This script, located in ~/wsprd, is called by all the fixed and rotating band scripts,
# since the coding is common for all.
# Variables 'this_band', 'this_script' and 'this_parameter' have been passed from each calling band script,
# referring to the current band of WSPR operation,the name of the band script & the band parameter used.

# recovering description of previous band
    echo $'\n'"----------------------------------------------" >> ~/wsprd/wlogs/wsprd.log
    
    prevfile="$HOME/wsprd/wlogs/wsprband.txt"
    # In the above line the tilde ~ is replaced by $HOME for use in the variable
    curr_status=""
    # Initializing curr_status
    while read -r prev_item
    do
        # Writing description of previous band, the specific band script, and the specific band parameter
        # that were used for it, to wsprd.log
        echo "$prev_item" >> ~/wsprd/wlogs/wsprd.log
        # Next checking if it is day begin, and if so setting a flag to be used later in this script
         if
            [ "$prev_item" == "NEW LOG FILE NOW OPENED" ]
         then
            curr_status="DAYBEGIN"
            # sets status as DAYBEGIN if new log file has been opened
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
 # for the current band. Since this causes it to dump all records of previous band to the wsprd.log file, the
 # activation time and name of previous band need to be written to the file first, which has been taken care of above.

# Now Recording description of current band, the specific band script, and the specific band parameter  being used for it,
# This can be checked through the ~/wsprd/utils/wwband.sh script
         curr_band="* * * * Running reception on : ""$this_band"" meters"
       curr_script="* * * * Using band script    : ""$this_script"
    curr_parameter="* * * * Using band parameter ::""$this_parameter"
              echo "$curr_band" > ~/wsprd/wlogs/wsprband.txt           
              echo "$curr_script" >> ~/wsprd/wlogs/wsprband.txt
              echo "$curr_parameter" >> ~/wsprd/wlogs/wsprband.txt
# recording time of current band activation for use when the next band is activated (formatted to line up)
              echo "* * * * ""$(date)" > ~/wsprd/wlogs/wsprbandtime.txt
# 12 spaces given before above printouts for easy readability

# ADDITONAL STEP for DAY BEGIN
# If the above variable curr_status has value 'DAYBEGIN' then
# the current band and time have to be written to newly ceated wsprd.log immediately so as to appear at the top of it.

# recording description of current band, the specific band script, and the specific band parameter  being used for it,
# in the wsprd log itself if it is DAY BEGIN
# (Now using above coding for uniformity)
   if
	[ "$curr_status" == "DAYBEGIN" ]
   then
   	echo "$curr_band" >> ~/wsprd/wlogs/wsprd.log
    echo "$curr_script" >> ~/wsprd/wlogs/wsprd.log
    echo "$curr_parameter" >> ~/wsprd/wlogs/wsprd.log
    # recording time of current band activation at DAY BEGIN
    echo "$(date)" >> ~/wsprd/wlogs/wsprd.log
    
	curr_status=""
    # made curr_status NIL for the rest of the day
   fi

# The user's callsign and grid location are written in ~/wsprd/wlogs/wspruser.txt
# Note : THE DEFAULTS FOR FRESH INSTALLTIONS ARE : callsign= ---A1*xyz & grid location= ---AB12*cd
# --------------------------------------------------------------------------------------------
# All references to these in band scripts, & the bandrecord script, need to be changed for the new user.
# And this is now handled through the menu script itself  -- wwmenu.sh

# exit
return 
# since this script is called using '.' instead of 'bash' it is in the same subshell as the calling script. 
# Hence recommended to end with 'return' rather than 'exit'  n
# end of file
