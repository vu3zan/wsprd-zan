#!/bin/bash
#
# Last mod 2023-01-15 by VU3ZAN Sunil Aruldas
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
 grep ' 50\.29' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 50\.30' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 50\.29' "$fullfile" -c  )
 cnt2=$(  grep  ' 50\.30' "$fullfile" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo " 6m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt
 
 echo "Count & Listing for 10m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 28\.12' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 28\.13' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 28\.12' "$fullfile" -c  )
 cnt2=$(  grep  ' 28\.13' "$fullfile" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo "  10m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 15m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 21\.09' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 21\.10' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 21\.09' "$fullfile" -c  )
 cnt2=$(  grep  ' 21\.10' "$fullfile" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo " 15m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 20m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 14\.09' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 14\.10' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 14\.09' "$fullfile" -c  )
 cnt2=$(  grep  ' 14\.10' "$fullfile" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo " 20m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt
 
 echo "Count & Listing for 40m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 7\.03' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 7\.04' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 7\.03' "$fullfile" -c  )
 cnt2=$(  grep  ' 7\.04' "$fullfile" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo " 40m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt 

 echo "Count & Listing for 80m [both new/old, whichever has been selected in the band script]" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.56' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.57' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.58' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.59' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.60' $fullfile  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 3\.57' "$fullfile" -c  )
 cnt2=$(  grep  ' 3\.57' "$fullfile" -c  )
 cnt3=$(  grep  ' 3\.58' "$fullfile" -c  )
 cnt4=$(  grep  ' 3\.59' "$fullfile" -c  )
 cnt5=$(  grep  ' 3\.60' "$fullfile" -c  )
 totcnt=$(($cnt1 + $cnt2 + $cnt3 + $cnt4 +$cnt5))
 echo " 80m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt 
 # allowing for old 80m wspr frequency 3.5926 still in use 
 
# Pl Note: A space before, as well as two decimal points, are given for each frequency
# because otherwise the program is giving false positives by picking up values like
# -21.0 in some other column of log file spot record such as SNR or DT

 echo "----------------------------" >> ~/wsprd/wlogs/wwcount.rpt
 echo >> ~/wsprd/wlogs/wwcount.rpt
 echo "VALID SPOTs ONLY - WITHOUT 'A000AA' and '<...>' cases (if any)" >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 6m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 50\.29' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 50\.30' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 50\.29' "$fullfile" | grep -v -E "A000AA\|<...>"  -c  )
 cnt2=$(  grep  ' 50\.30' "$fullfile" | grep -v -E "A000AA\|<...>"  -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo " 6m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt
 
 echo "Count & Listing for 10m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 28\.12' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 28\.13' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 28\.12' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 cnt2=$(  grep  ' 28\.13' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo "  10m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 15m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 21\.09' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 21\.10' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 21\.09' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 cnt2=$(  grep  ' 21\.10' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo " 15m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt

 echo "Count & Listing for 20m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 14\.09' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 14\.10' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 14\.09' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 cnt2=$(  grep  ' 14\.10' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo " 20m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt
 
 echo "Count & Listing for 40m" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 7\.03' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 7\.04' $fullfile | grep -v -E "A000AA\|<...>" >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 7\.03' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 cnt2=$(  grep  ' 7\.04' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 totcnt=$(($cnt1 + $cnt2))
 echo " 40m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt 

 echo "Count & Listing for 80m [both new/old, whichever has been selected in the band script]" >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.56' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.57' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.58' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.59' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 grep ' 3\.60' $fullfile | grep -v -E "A000AA\|<...>"  >> ~/wsprd/wlogs/wwcount.rpt
 cnt1=$(  grep  ' 3\.56' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 cnt2=$(  grep  ' 3\.57' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 cnt3=$(  grep  ' 3\.58' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 cnt4=$(  grep  ' 3\.59' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 cnt5=$(  grep  ' 3\.60' "$fullfile" | grep -v -E "A000AA\|<...>" -c  )
 totcnt=$(($cnt1 + $cnt2 + $cnt3 + $cnt4 + $cnt5))
 echo " 80m count : ""$totcnt" >> ~/wsprd/wlogs/wwcount.rpt 
 # allowing for old 80m wspr frequency 3.5926 still in use 
 
 # Pl Note: A space before, as well as two decimal points, are given for each frequency
# because otherwise the program is giving false positives by picking up values like
# -21.0 in some other column of log file spot record such as SNR or DT
 
 less  ~/wsprd/wlogs/wwcount.rpt 
 echo

# end of file
