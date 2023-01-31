#!/bin/bash
#
# Last mod 2023-01-26 by VU3*ZAN Sunil Aruldas
# Bash file 'wwtrack.sh' for Guenael rtlsdr_wsprd log in ~/wsprd/wlogs/wsprd.log 
# to view it as default without giving any file name.
# Used thus "bash wwtrack.sh" 
# NOTE : This MONITORS the current log file, displaying data as and when it is written to file 
# The screen cannot be navigated while this script is running
# You can EXIT this script by Ctrl-C both normally and when hanging
#
# ### ALSO NOTE: This script will HANG after the daily backup is carried out, 
# ### when the EXISTING wsprd.log file is renamed as backups/b1.log and REPLACED by a NEW wsprd.log

# Now the beginning is modified for calling by script file wwmenu.sh

echo
echo "This is Utility Script '** wwtrack.sh **' for Guenael rtlsdr_wsprd log" 
echo
echo "NOTE : This MONITORS the CURRENT log file, displaying data as and when it is written to file" 
echo
echo " * File under analysis : $HOME/wsprd/wlogs/wwtrack"
echo 
less +F ~/wsprd/wlogs/wsprd.log
wc -l ~/wsprd/wlogs/wsprd.log

echo

# end of file
