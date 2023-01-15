#!/bin/bash
#
# Last mod 2023-01-14 by --VU3ZAN Sunil Aruldas
# Arrangement for a form of WSPR band hopping using WSPR daemon ~/rtlsdr-wsprd/rtlsdr_wsprd
# NOTE: rtlsdr_wsprd is a WSPR daemon by Guenael VA2GKA on Github. RESPECT!!

# This script is for ## 80m, located in ~/wsprd, and ORIGINALLY NAMED 6mR.sh

# HOWEVER the SCRIPT NAMES WILL CHANGE DAILY on a ROTATION basis as 1/2/3/4/5/6m5 [this is normal !!], 
# in order to provide a "changing time slot access" to different bands at different times of day
# as a possibly acceptable (!) implementation of band hopping.
# See the file ~/wsprd/samples/wsprd-hop-how.txt file for an explanation of the system.

# Variables for this band name, script name and band parameter are set below and passed to script wwbandrecord.sh
    this_band="80"
    this_script=$(basename -- "$0")
# Setting band parameter as 1, 2 or 3
    bandparam=1
if [ "$bandparam" -eq 1 ]; then this_parameter="80m"
elif [ "$bandparam" -eq 2 ]; then this_parameter="3.5686M"
else this_parameter="3.568600M"
fi
# PL NOTE: 'variable bandparam' is also used below to select the appropriate one of three script lines provided

# Calling script wwbandrecord.sh for recovering description and time of activation of previous band
# as well as for recording description and time of activation of current band 
# for use when the next band is activated later
# CARE -- use '.' (DOT) command instead of 'bash' below, to enable passing of above variables !!

    ( . $HOME/wsprd/wwbandrecord.sh )



    echo $'\n'"---Kill earlier WSPR rtlsdr_wsprd session---" >> ~/wsprd/wlogs/wsprd.log
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Kill any existing instance of rtlsdr_wsprd
    sleep 5
        pgrep rtlsdr_wsprd > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                killall rtlsdr_wsprd &>> ~/wsprd/wlogs/wsprd.log
            fi
    sleep 15
# the above gives time for the kill process to finish, before starting a new instance of rtlsdr_wsprd

# Activation of new WSPR session [a new instance of rtlsdr_wsprd]
# Here please type the ## -f BAND NAME/FREQUENCY, ## -c CALLSIGN (12 chars max), ## -l grid LOCATION (6 chars max).
# Default gain is -g 29
# [ PL NOTE: Three readymade script lines are provided using different parameters :
# either Band name, Band frequency, or Band frequency with additional 2 zeroes.
# Which one is selected depends on the value of the variable bandparam which is set to 1, 2 or 3 at the top of this script.
# The description of the parameter is also passed there to the wwbandrecord.sh script]

#  Using bandparam variable (1, 2 or 3)  as set above
if [ "$bandparam" -eq 1 ]; then
 ~/rtlsdr-wsprd/rtlsdr_wsprd -f 80m -c   VU3ZAN -l   MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &
elif [ "$bandparam" -eq 2 ]; then
  ~/rtlsdr-wsprd/rtlsdr_wsprd -f 3.5686M -c   VU3ZAN -l   MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &
else
  ~/rtlsdr-wsprd/rtlsdr_wsprd -f 3.568600M -c   VU3ZAN -l   MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &
fi

# OLD WSPR frequency for 80m band is below
    # this_parameter="OLD 3.5926M"
# ~/rtlsdr-wsprd/rtlsdr_wsprd -f 3.5926M -c VU3ZAN -l MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &
    # this_parameter="OLD 3.592600M"
# ~/rtlsdr-wsprd/rtlsdr_wsprd -f 3.592600M -c VU3ZAN -l MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &

# This WSPR session will normally continue until it is killed preparatory to the next session for next band.


# END of program

