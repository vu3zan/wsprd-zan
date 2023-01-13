#!/bin/bash
#
# Last mod 2023-01-10 by --VU3ZAN Sunil Aruldas
# Arrangement for a form of WSPR band hopping using WSPR daemon ~/rtlsdr-wsprd/rtlsdr_wsprd
# NOTE: rtlsdr_wsprd is a WSPR daemon by Guenael VA2GKA on Github. RESPECT!!

# This script is for ## 10m, located in ~/wsprd, and ORIGINALLY NAMED 2mR.sh

# HOWEVER the SCRIPT NAMES WILL CHANGE DAILY on a ROTATION basis as 1/2/3/4/5/6m5 [this is normal !!], 
# in order to provide a "changing time slot access" to different bands at different times of day
# as a possibly acceptable (!) implementation of band hopping.
# See the file ~/wsprd/samples/wsprd-hop-how.txt file for an explanation of the system.

# Variables for this band name, script name and band parameter are set below and passed to script wwbandrecord.sh
    this_band="10"
    this_script=$(basename -- "$0")

# Calling script wwbandrecord.sh for recovering description and time of activation of previous band
# as well as for recording description and time of activation of current band 
# for use when the next band is activated later

    ( bash $HOME/wsprd/wwbandrecord.sh )


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
# Three paired lines are provided for use of Band name, Band frequency, or Band frequency with additional 2 zeroes
# while also recording the specific script being used.
# Only one pair can be put into use at one time.
# Please comment out the two pairs which are not being used.

#    this_parameter="10m"
# ~/rtlsdr-wsprd/rtlsdr_wsprd -f 10m -c VU3ZAN -l MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &
   this_parameter="28.1246M" 
~/rtlsdr-wsprd/rtlsdr_wsprd -f 28.1246M -c VU3ZAN -l MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &
    #   this_parameter="28.124600M" 
# ~/rtlsdr-wsprd/rtlsdr_wsprd -f 28.124600M -c VU3ZAN -l MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &


# This WSPR session will normally continue until it is killed preparatory to the next session for next band.


# END of program
 
