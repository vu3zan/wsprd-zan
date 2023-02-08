#!/bin/bash
#
# Last mod 2023-02-08 by VU3*ZAN Sunil Aruldas
# Bash file 'wwspot.sh' for Guenael rtlsdr_wsprd current log in ~/wsprd/wlogs/wsprd.log 
# to use it as default without giving any file name.
# to put all Spots in a file ~/wsprd/wlogs/wwspot.rpt
# Also analyze the backup logs in $HOME/wsprd/wlogs/backups/ 
# Used thus : 'bash wwspot.sh bn'  --- where n is 1 to 8 for each of 8 backup log files b1.log to b8.log

# Now the beginning is modified for calling by script file wwmenu
# genfile=$1
echo
echo "This is Utility Script '** wwspot.sh **' for Guenael rtlsdr_wsprd log" 
echo
fullfile=""
while [[ -z $fullfile ]];
do
echo "Please enter Blank for Default (wsprd.log) or b1 to b8 for 8 days backup logs"
echo 
read -p "Entry ?  "  genfile

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

 echo "Bash file 'wwspot.sh' for Guenael rtlsdr_wsprd current log in " > ~/wsprd/wlogs/wwspot.rpt
 echo "to use it as default, without giving any file name."  >> ~/wsprd/wlogs/wwspot.rpt
 echo "to put all Spots in a file ~/wsprd/wlogs/wwspot.rpt"  >> ~/wsprd/wlogs/wwspot.rpt
 echo "Also analyze the backup logs "  >> ~/wsprd/wlogs/wwspot.rpt
 echo "Used thus :  'bash wwspot.sh bn' --- where n is 1 to 8 for each of 8 backup log files b1.log to b8.log " >> ~/wsprd/wlogs/wwspot.rpt
 echo >> ~/wsprd/wlogs/wwspot.rpt
 echo " * File under analysis : ""$fullfile" >> ~/wsprd/wlogs/wwspot.rpt
 echo "For the FILE VIEWER, f / b / q = forward / backward / quit"  >> ~/wsprd/wlogs/wwspot.rpt
 echo  >> ~/wsprd/wlogs/wwspot.rpt
 echo "             Time in UTC" >> ~/wsprd/wlogs/wwspot.rpt
echo " * Report File  : ~/wsprd/wlogs/wwspot.rpt"


grep 'Spot :' "$fullfile" >> ~/wsprd/wlogs/wwspot.rpt

less ~/wsprd/wlogs/wwspot.rpt
echo
wc  -l ~/wsprd/wlogs/wwspot.rpt 
echo "(less 10 lines used for description heading)"
echo

# end of file
