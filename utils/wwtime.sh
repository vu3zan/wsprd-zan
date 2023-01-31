#!/bin/bash
#
# Last mod 2023-01-26 by VU3*ZAN Sunil Aruldas
# Bash file 'wwtime.sh' for Guenael rtlsdr_wsprd log in ~/wsprd/wlogs/wsprd.log 
# and to use it as default without giving any file name.
# to list times of activation of the rtlsdr_wsprd daemon in file  ~/wsprd/wlogs/wwtime.rpt
# Also analyze the backup logs in $HOME/wsprd/wlogs/backups/
# Used thus "bash wwtime.sh bn" where n is 1 to 8 for each of 8 log files b1.log to b8.log.

# Now the beginning is modified for calling by script file wwmenu.sh
# genfile=$1
echo
echo "This is Utility Script '** wwtime.sh **' for Guenael rtlsdr_wsprd log "
echo
echo "Please enter Blank for Default (wsprd.log) or b1 to b8 for 8 days backup logs"
echo 
read -p "Entry ?  "  genfile

fullfile=""
logfile="$HOME/wsprd/wlogs/wsprd.log"

if 
	[ -z $genfile ] # file name is not given, variable is empty
then
	fullfile="$logfile" # default file is current wsprd.log
else
	case $genfile in
		b1 | b2 | b3 | b4 | b5 | b6 | b7 | b8)
			genfile2="$genfile"".log"
			fullfile="$HOME/wsprd/wlogs/backups/""$genfile2";;
		*)
			echo
			echo "Sorry! No such file exists/permitted"
			echo "Please enter Blank for default, or file name 'b1' to 'b8' only"
			echo
			exit;;
	esac

fi

echo " * File under analysis : ""$fullfile"


 echo "Bash file 'wwtime.sh' for Guenael rtlsdr_wsprd current log" > ~/wsprd/wlogs/wwtime.rpt
 echo "and to use it as default without giving any file name" >> ~/wsprd/wlogs/wwtime.rpt
 echo "to list times of activation of the rtlsdr_wsprd daemon in file ~/wsprd/wlogs/wwtime.rpt" >> ~/wsprd/wlogs/wwtime.rpt
 echo "Also analyze the backup logs in $HOME/wsprd/wlogs/backups/"  >> ~/wsprd/wlogs/wwtime.rpt
 echo "Used thus : 'bash wwtime.sh bn' where n is 1 to 8 for each of 8 log files b1.log to b8.log " >> ~/wsprd/wlogs/wwtime.rpt
 echo >> ~/wsprd/wlogs/wwtime.rpt
 echo " * File under analysis : ""$fullfile">> ~/wsprd/wlogs/wwtime.rpt
 echo "For the FILE VIEWER, f / b / q = forward / backward / quit"  >> ~/wsprd/wlogs/wwtime.rpt
 echo >> ~/wsprd/wlogs/wwtime.rpt
echo " * Report File  : ~/wsprd/wlogs/wwtime.rpt"

echo
# grep 'IST' ~/wsprd/wlogs/wsprd.log >> ~/wsprd/wlogs/wwtime.rpt
grep 'Starting rtlsdr' ~/wsprd/wlogs/wsprd.log >> ~/wsprd/wlogs/wwtime.rpt

 less  ~/wsprd/wlogs/wwtime.rpt
 wc -l ~/wsprd/wlogs/wwtime.rpt 
echo "(less 9 lines used for description heading)"
echo "(reduce the first 1 or 2 lines also, based on the activation times)"
echo

# end of file
