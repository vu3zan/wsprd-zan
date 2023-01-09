#!/bin/bash
#
# Last mod 2023-01-09 by VU3ZAN Sunil Aruldas
# bash file 'wwcallsign.sh' for Guenael rtlsdr_wsprd current log in ~/wsprd/wlogs/wsprd.log
# to use it as default without giving any file name.
# to put all 'callsign' Spots in a file ~/wsprd/wlogs/wwcallsign.rpt
# Fresh analysis every time
# Also analyze the backup logs in $HOME/wsprd/wlogs/backups/ 
# Used thus : 'bash wwcallsign.sh bn'  --- where n is 1 to 8 for each of 8 backup log files b1.log to b8.log
# Also analyze the wwvalidlist.log in $HOME/wsprd/wlogs/ by giving 'valid'
# CARE: If 1 or 2 letters only are given, it may pick up from location column also - false positives

# Now the beginning is modified for calling by script file wwmenu.sh
# genfile=$1

echo
echo "This is Utility Script '** wwcallsign.sh **' for Guenael rtlsdr_wsprd log" 
echo
echo "Please enter Blank for Default (wsprd.log) or b1 to b8 for 8 days backup logs"
echo "or 'valid' for using the wwvalidlist.log"
echo
read -p "Entry ?  " genfile

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

# Now asks for callsign or first few letters
gencall=""
uppcall=""
while [ -z $gencall ]
do
  echo
  echo "Please enter the callsign to be searched for in capitals, either in full form" 
  echo "    or as the first few letters (without any other characters such as '*' !)"
  echo "       For example 'VU2' will find all 'VU2' callsigns"
  echo "[[ CARE: If 1 or 2 letters only are given," 
  echo "         it may pick up from Location column also - giving False Positives]]"
  echo
  read -p "Callsign or first few letters ?  " gencall

  if
	[ -n $gencall ]
  then
	uppcall=$(echo $gencall | tr '[:lower:]' '[:upper:]')
	# call sign in gencall is converted to capitals in upcall and used later as uppcall

  else
		echo
		echo "You have not entered any call sign details as yet, please try again"
		echo "Press ENTER to continue ..."
		read genpause
		echo
  fi
done

echo " * File under analysis : ""$fullfile"
echo " * Call sign (or first few letters) searched for : ""$uppcall"

 echo "Bash file 'wwcallsign.sh' for Guenael rtlsdr_wsprd current log " > ~/wsprd/wlogs/wwcallsign.rpt
 echo "to use it as default without giving any file name." >> ~/wsprd/wlogs/wwcallsign.rpt
 echo "putting all * ""$uppcall"" *"  >> ~/wsprd/wlogs/wwcallsign.rpt
 echo "Spots in a file ~/wsprd/wlogs/wwcallsign.rpt" >> ~/wsprd/wlogs/wwcallsign.rpt
 echo "Fresh analysis every time ">> ~/wsprd/wlogs/wwcallsign.rpt
 echo "Also analyze the backup logs"  >> ~/wsprd/wlogs/wwcallsign.rpt
 echo "Used thus : 'bash wwcallsign.sh bn'  --- where n is 1 to 8 for each of 8 backup log files b1.log to b8.log ">> ~/wsprd/wlogs/wwcallsign.rpt
 echo "Also analyze the wwvalidlist.log in $HOME/wsprd/wlogs/ by giving 'valid'" >> ~/wsprd/wlogs/wwcallsign.rpt
 echo "CARE: If 1 or 2 letters only are given, it may pick up from location column also - giving False Positives"

 echo >> ~/wsprd/wlogs/wwcallsign.rpt
 echo " * File under analysis : ""$fullfile" >> ~/wsprd/wlogs/wwcallsign.rpt
 echo " * Call sign (or first few letters) searched for : ""$uppcall" >> ~/wsprd/wlogs/wwcallsign.rpt
 echo >> ~/wsprd/wlogs/wwcallsign.rpt
 echo "For the FILE VIEWER, f / b / q = forward / backward / quit"  >> ~/wsprd/wlogs/wwcallsign.rpt
 echo >> ~/wsprd/wlogs/wwcallsign.rpt
 echo " * Report File  : ~/wsprd/wlogs/wwcallsign.rpt"

  grep 'Spot : ' "$fullfile" | grep "$uppcall" >> ~/wsprd/wlogs/wwcallsign.rpt
  grep 'Spot : ' "$fullfile" | grep "$uppcall" -c >> ~/wsprd/wlogs/wwcallsign.rpt

 less ~/wsprd/wlogs/wwcallsign.rpt
  wc  -l ~/wsprd/wlogs/wwcallsign.rpt 
  echo "(less 14 lines used for description heading)"
  echo

  
  # end of file

