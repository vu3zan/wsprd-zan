#!/bin/bash
#
# Last mod 2023-01-26 by VU3*ZAN Sunil Aruldas
# Bash file 'wwlog.sh' for Guenael rtlsdr_wsprd current log in ~/wsprd/wlogs/wsprd.log 
# to view it as default without giving any file name.
# Also read the backup logs in $HOME/wsprd/wlogs/backups/ 
# Used thus "bash wwlog.sh bn" where n is 1 to 8 for each of 8 log files b1.log to b8.log. 
# Also read the wwvalidlist.log & wwinvalidlist.log in $HOME/wsprd/wlogs/ by 
# giving 'valid' & 'invalid'. 

# sudo less ~/wsprd/wlogs/wsprd.log 

# Now the beginning is modified for calling by script file wwmenu.sh
# genfile=$1
echo
echo "This is Utility Script '** wwlog.sh **' for Guenael rtlsdr_wsprd log" 
echo

# testing
fullfile=""
while [[ -z $fullfile ]];
do
echo "Please enter Blank for Default (wsprd.log) or b1 to b8 for 8 days backup logs"
echo "or 'valid / invalid' for using the wwvalidlist.log / wwinvalidlist.log"
echo "or Q to quit ..."
echo
read -p  "Entry ?  "  genfile

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
		valid)
			genfile2="ww""$genfile""list.log"
			fullfile="$HOME/wsprd/wlogs/""$genfile2";;
		invalid)
			genfile2="ww""$genfile""list.log"
			fullfile="$HOME/wsprd/wlogs/""$genfile2";;
		q)
			echo
			echo " ... quitting ..."
			echo
			exit;;
		*)
			echo
			echo "Sorry! No such file exists/permitted"
			echo
			fullfile="";; 
			# acts as flag
	esac

fi
done
# testing done

echo " * File under analysis : ""$fullfile"
echo "Able to view the current log file as default without giving any file name."
echo "Can also analyze the backup logs in $HOME/wsprd/wlogs/backups/" 
echo "Used thus : 'bash wwlog.sh bn'  --- where n is 1 to 8 for each of 8 backup log files b1.log to b8.log"
echo "Can also read the wwvalidlist.log & wwinvalidlist.log in $HOME/wsprd/wlogs/ by "
echo "giving 'valid' & 'invalid'."
echo "For the FILE VIEWER, f / b / q = forward / backward / quit" 
echo

less "$fullfile"
wc -l "$fullfile"

echo

# end of file
