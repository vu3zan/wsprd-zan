#!/bin/bash
#
# Last mod 2023-01-09 by VU3ZAN Sunil Aruldas
# Bash file 'wwcount.sh' for Guenael rtlsdr_wsprd current log in ~/wsprd/wlogs/wsprd.log
# to use as default without giving any file name.
# to put all Spots, and then all NON 'A000AA'& '<...>' Spots, counted frequency wise, in a file ~/wsprd/wlogs/wwcount.rpt 
# Also analyze the backup logs in $HOME/wsprd/wlogs/backups/ 
# Used thus : 'bash wwcount.sh bn' where n is 1 to 8 for each of 8 backup log files b1.log to b8.log 
# Also analyze the wwvalidlist.log in $HOME/wsprd/wlogs/ by giving 'valid'


# Now the beginning is modified for calling by script file wwmenu.sh
# genfile=$1
echo
echo "This is Utility Script '** wwcount.sh **' for Guenael rtlsdr_wsprd log" 
echo
echo "Please enter Blank for Default (wsprd.log) or b1 to b8 for 8 days backup logs"
echo "or 'valid' for using the wwvalidlist.log"
echo
read -p  "Entry ?  "  genfile

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

 echo "Bash file 'wwcount.sh' for Guenael rtlsdr_wsprd current log " > ~/wsprd/wlogs/wwcount.rpt
 echo "to use it as default without giving any file name."  >> ~/wsprd/wlogs/wwcount.rpt
 echo t"o put all Spots, and then all valid Spots,counted frequency wise, in a file ~/wsprd/wlogs/wwcount.rpt " >> ~/wsprd/wlogs/wwcount.rpt
 echo "Also analyze the backup logs " >> ~/wsprd/wlogs/wwcount.rpt
 echo "Used thus : 'bash wwcount.sh bn' where n is 1 to 8 for each of 8 log files b1.log to b8.log ">> ~/wsprd/wlogs/wwcount.rpt
 echo "Also analyze the list of valid logs by giving 'valid'" >> ~/wsprd/wlogs/wwcount.rpt
 echo >> ~/wsprd/wlogs/wwcount.rpt
 echo " * File under analysis : ""$fullfile" >> ~/wsprd/wlogs/wwcount.rpt
 echo "For the FILE VIEWER, f / b / q = forward / backward / quit"  >> ~/wsprd/wlogs/wwcount.rpt
 echo >> ~/wsprd/wlogs/wwcount.rpt
echo " * Report File  : ~/wsprd/wlogs/wwcount.rpt"



 echo "Count & Listing for 6m" >> ~/wsprd/wlogs/wwcount.rpt
 grep '50\.29' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep  '50\.29' $fullfile  -c >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 10m" >> ~/wsprd/wlogs/wwcount.rpt
 grep '28\.12' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep  '28\.12' $fullfile  -c >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 15m" >> ~/wsprd/wlogs/wwcount.rpt
 grep '21\.09' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep  '21\.09' $fullfile  -c >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 20m" >> ~/wsprd/wlogs/wwcount.rpt
 grep '14\.09' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep  '14\.09' $fullfile  -c >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 40m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 7\.04' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep  ' 7\.04' $fullfile  -c >> ~/wsprd/wlogs/wwcount.rpt
 # used 7.04 instead of 7.03 because that is what is seen

 echo "Count & Listing for 80m [both new/old whichever has been selected]" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.57' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep  ' 3\.57' $fullfile  -c >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.59' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep  ' 3\.59' $fullfile  -c >> ~/wsprd/wlogs/wwcount.rpt
 # allowing for old 80m wspr frequency still in use 
  # used 3.57 instead of 3.56 because that is what is seen

# Pl Note: two decimal points are given for each frequency
# because otherwise the wwcount program is giving false positives by picking up values like
# 21.0 in some other column of log file spot record

 echo "----------------------------" >> ~/wsprd/wlogs/wwcount.rpt
 echo >> ~/wsprd/wlogs/wwcount.rpt
 echo "VALID SPOTs ONLY - WITHOUT 'A000AA' and '<...>' cases ">> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 6m" >> ~/wsprd/wlogs/wwcount.rpt
 grep '50\.29' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep  '50\.29' $fullfile | grep -v -E "A000AA\|<...>"  -c >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 10m" >> ~/wsprd/wlogs/wwcount.rpt
 grep '28\.12' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep  '28\.12' $fullfile | grep -v -E "A000AA\|<...>"  -c >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 15m" >> ~/wsprd/wlogs/wwcount.rpt
 grep '21\.09' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep  '21\.09' $fullfile | grep -v -E "A000AA\|<...>"  -c >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 20m" >> ~/wsprd/wlogs/wwcount.rpt
 grep '14\.09' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep  '14\.09' $fullfile | grep -v -E "A000AA\|<...>"  -c >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 40m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 7\.04' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep  ' 7\.04' $fullfile | grep -v -E "A000AA\|<...>"  -c >> ~/wsprd/wlogs/wwcount.rpt
 # used 7.04 instead of 7.03 because that is what is seen

 echo "Count & Listing for 80m [both new/old whichever has been selected]" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.57' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep  ' 3\.57' $fullfile | grep -v -E "A000AA\|<...>"  -c >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.59' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep  ' 3\.59' $fullfile | grep -v -E "A000AA\|<...>"  -c >> ~/wsprd/wlogs/wwcount.rpt
 # allowing for old 80m wspr frequency still in use 
 # used 3.57 instead of 3.56 because that is what is seen

 
 less  ~/wsprd/wlogs/wwcount.rpt 
 echo

# end of file