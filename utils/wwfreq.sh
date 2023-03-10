#!/bin/bash
#
# Last mod 2023-02-08 by VU3*ZAN Sunil Aruldas
# Bash file 'wwfreq.sh' for Guenael rtlsdr_wsprd current log in ~/wsprd/wlogs/wsprd.log 
# and to use it as default without giving any file name.
# to list Dial frequencies of band change in a file ~/wsprd/wlogs/wwfreq.rpt
# Also analyze the backup logs in $HOME/wsprd/wlogs/backups/
# Used thus : 'bash wwfreq.sh bn' where n is 1 to 8 for each of 8 log files b1.log to b8.log

# Now the beginning is modified for calling by script file wwmenu.sh
# genfile=$1
echo
echo "This is Utility Script '** wwfreq.sh **' for Guenael rtlsdr_wsprd log" 
echo
fullfile=""
while [[ -z $fullfile ]];
do
echo "Please enter Blank for Default (wsprd.log) or b1 to b8 for 8 days backup logs"
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

echo " * File under analysis : ""$fullfile"

 echo "Bash file 'wwfreq.sh' for Guenael rtlsdr_wsprd current log " > ~/wsprd/wlogs/wwfreq.rpt
 echo "and to use it as default without giving any file name."  >> ~/wsprd/wlogs/wwfreq.rpt
 echo "to list Dial frequencies of band change in a file ~/wsprd/wlogs/wwfreq.rpt"  >> ~/wsprd/wlogs/wwfreq.rpt
 echo "Also analyze the backup logs " >> ~/wsprd/wlogs/wwfreq.rpt
 echo "Used thus : 'bash wwfreq.sh bn' where n is 1 to 8 for each of 8 log files b1.log to b8.log" >> ~/wsprd/wlogs/wwfreq.rpt
 echo >> ~/wsprd/wlogs/wwfreq.rpt
 echo " * File under analysis : ""$fullfile">> ~/wsprd/wlogs/wwfreq.rpt
 echo "For the FILE VIEWER, f / b / q = forward / backward / quit"  >> ~/wsprd/wlogs/wwfreq.rpt
 echo >> ~/wsprd/wlogs/wwfreq.rpt
echo " * Report File  : ~/wsprd/wlogs/wwfreq.rpt"

grep 'Dial freq.' "$fullfile" >> ~/wsprd/wlogs/wwfreq.rpt

# cat ~/wsprd/wlogs/wwfreq.rpt
less  ~/wsprd/wlogs/wwfreq.rpt
wc  -l  ~/wsprd/wlogs/wwfreq.rpt 
echo "(less 9 lines used for description heading)"
echo

# end of file
