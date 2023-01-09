#!/bin/bash
#
# Last mod 2023-01-09, by VU3ZAN Sunil Aruldas
# Arrangement for WSPR reception in a utility environment for
# using WSPR daemon ~/rtlsdr-wsprd/rtlsdr_wsprd
# NOTE: rtlsdr_wsprd is a WSPR daemon by Guenael VA2GKA on Github. RESPECT!!

# This script is for ## 6m, located in ~/wsprd, and named  6mF.sh
# Variables for this band and script name are set below and passed to script wwbandrecord
    this_band="6"
    this_script=$(basename -- "$0")

# Calling script wwbandrecord for recovering description and time of activation of previous band
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
# while recording the specific script being used.
# Only one pair can be put into use at one time.
# Please comment out the two pairs which are not being used.

    echo "using wsprd band parameter 6m" >> ~/wsprd/wlogs/wsprband.txt
~/rtlsdr-wsprd/rtlsdr_wsprd -f 6m -c VU3ZAN -l MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &
    #   echo "using wsprd band parameter 50.2930M" >> ~/wsprd/wlogs/wsprband.txt
# ~/rtlsdr-wsprd/rtlsdr_wsprd -f 50.2930M -c VU3ZAN -l MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &
        #   echo "using wsprd band parameter 50.293000M" >> ~/wsprd/wlogs/wsprband.txt
# ~/rtlsdr-wsprd/rtlsdr_wsprd -f 50.293000M -c VU3ZAN -l MK90it -g 29 &>> ~/wsprd/wlogs/wsprd.log &

# Note: From Dec 2022 the band name can be used instead of the direct frequency e.g. 10m
# However, if no spots are received then please try the direct frequency in Mhz, with 'M' after it
# WSPR freq 1.8366M, 3.5686M NEW, 3.5926M OLD, 5.2872M, 5.3647M, 7.0386M
# 10.1387M, 14.0956M, 18.1046M, 21.0946M, 24.9246M, 28.1246M, 50.2930M
# However, I had earlier found it necessary to add two more zeroes "00" after the frequency parameter 
# e.g. "28.124600M", instead of "28.1246M", so please try this also if needed

# This WSPR session will normally continue until it is killed preparatory to the next session for next band.


# END of file
 