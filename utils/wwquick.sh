#!/bin/bash
#
# Last mod 2023-01-09 by VU3ZAN Sunil Aruldas
# bash file 'wwquick.sh' for Guenael rtlsdr_wsprd current log in ~/wsprd/wlogs/
# to use it as default without giving any file name.
# to count ALL Spots frequency wise, in a file ~/wsprd/wlogs/wwquick.rpt
# Also analyze the backup logs in $HOME/wsprd/wlogs/backups/ 
# Used thus : 'bash wwquick.sh bn' where n is 1 to 8 for each of 8 backup log files b1.log to b8.log. 
# Also analyze the wwvalidlist.log in $HOME/wsprd/wlogs/ by giving 'valid'

# Now the beginning is modified for calling by script file wwmenu
# genfile=$1
echo
echo "This is Utility Script '** wwquick.sh **' for Guenael rtlsdr_wsprd log "
echo
echo "Please enter Blank for Default (wsprd.log) or b1 to b8 for 8 days backup logs"
echo "or 'valid' for using the wwvalidlist.log"
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
		valid)
			genfile2="ww""$genfile""list.log"
			fullfile="$HOME/wsprd/wlogs/""$genfile2";;
		*)
			echo
			echo "Sorry! No such file exists/permitted"
			echo "Please enter Blank for default, or file name 'b1' to 'b8' only, or 'valid'"
			echo
			exit;;
	esac

fi

echo " * File under analysis : ""$fullfile"

 echo "Bash file 'wwquick.sh' for Guenael rtlsdr_wsprd current log " > ~/wsprd/wlogs/wwquick.rpt
 echo "To use it as default without giving any file name." >> ~/wsprd/wlogs/wwquick.rpt
 echo "To count ALL Spots frequency-wise" >> ~/wsprd/wlogs/wwquick.rpt
 echo "and record the count in a file ~/wsprd/wlogs/wwquick.rpt" >> ~/wsprd/wlogs/wwquick.rpt
 echo >> ~/wsprd/wlogs/wwquick.rpt
 echo "Also analyze the backup logs" >> ~/wsprd/wlogs/wwquick.rpt
 echo "Used thus : 'bash wwquick.sh bn' where n is 1 to 8 for each of 8 backup log files b1.log to b8.log." >> ~/wsprd/wlogs/wwquick.rpt
 echo "Also analyze the wwvalidlist.log by giving 'valid'" >> ~/wsprd/wlogs/wwquick.rpt

 echo " * File under analysis : ""$fullfile" >> ~/wsprd/wlogs/wwquick.rpt
 echo "For the FILE VIEWER, f / b / q = forward / backward / quit"  >> ~/wsprd/wlogs/wwquick.rpt
 echo >> ~/wsprd/wlogs/wwquick.rpt
echo " * Report File  : ~/wsprd/wlogs/wwquick.rpt"

 echo "----------------------------" >> ~/wsprd/wlogs/wwquick.rpt
 echo "ALL SPOTs" >> ~/wsprd/wlogs/wwquick.rpt
 echo    "Counting for 6m ">> ~/wsprd/wlogs/wwquick.rpt
 grep  '50\.29' "$fullfile" -c >> ~/wsprd/wlogs/wwquick.rpt

 echo    "Counting for 10m ">> ~/wsprd/wlogs/wwquick.rpt
 grep  '28\.12' "$fullfile" -c >> ~/wsprd/wlogs/wwquick.rpt

 echo    "Counting for 15m" >> ~/wsprd/wlogs/wwquick.rpt
 grep  '21\.09' "$fullfile" -c >> ~/wsprd/wlogs/wwquick.rpt

 echo    "Counting for 20m" >> ~/wsprd/wlogs/wwquick.rpt
 grep  '14\.09' "$fullfile" -c >> ~/wsprd/wlogs/wwquick.rpt

 echo    "Counting for 40m" >> ~/wsprd/wlogs/wwquick.rpt
 grep  ' 7\.04' "$fullfile"  -c >> ~/wsprd/wlogs/wwquick.rpt
 # used 7.04 instead of 7.03 because that is what is seen

 echo "Counting for 80m [both new/old whichever has been selected]" >> ~/wsprd/wlogs/wwquick.rpt
 grep  ' 3\.57' "$fullfile"  -c >> ~/wsprd/wlogs/wwquick.rpt
 grep  ' 3\.59' "$fullfile" -c >> ~/wsprd/wlogs/wwquick.rpt
 # used 3.57 instead of 3.56 because that is what is seen
 # allowing for old 80m wspr frequency still in use 
 
# Pl Note: two decimal points are given for each frequency
# because otherwise the wwcount program is giving false positives by picking up values like
# 21.0 in some other column of log file spot record

less  ~/wsprd/wlogs/wwquick.rpt 
echo

# end of file



