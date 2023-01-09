#!/bin/bash
#
# Last mod 2023-01-09 by VU3ZAN Sunil Aruldas
# bash file 'ww-rotate.sh' for Guenael rtlsdr_wsprd current log in ~/wsprd/wlogs/wsprd.log 
# to rotate 6 band files by renaming them as 1 to 6 in rotation, triggered by crontab at 9.55am every day
# when the rotation feature has been activated through crontab
# 
mv ~/wsprd/6mR.sh  ~/wsprd/0mR.sh
# this file 0mR is a temporary placeholder file, to be renamed as 1mR at the end 
sleep 2
mv ~/wsprd/5mR.sh  ~/wsprd/6mR.sh
sleep 2
mv ~/wsprd/4mR.sh  ~/wsprd/5mR.sh
sleep 2
mv ~/wsprd/3mR.sh  ~/wsprd/4mR.sh
sleep 2
mv ~/wsprd/2mR.sh  ~/wsprd/3mR.sh
sleep 2
mv ~/wsprd/1mR.sh  ~/wsprd/2mR.sh
sleep 2
mv ~/wsprd/0mR.sh  ~/wsprd/1mR.sh
sleep 2

# the earlier file 1mR.sh has become 2mR.sh, earlier file 2mR.sh has become 3mR.sh and so on .
# Since the actual band selection is hard coded inside the band scripts, this means that 
# the crontab schedule will effectively cause a different sequence of bands to be activated,
# thus enabling rotation of bands
# The sleep 2 seconds command is to make sure the renaming process is finished before next renamimg starts

# end of file
