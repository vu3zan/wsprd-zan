#!/bin/bash
#
# Last mod 2023-01-09 by VU3ZAN Sunil Aruldas
# Bash file 'wwmenu.sh' for running utility scripts for utility environment for
# Guenael rtlsdr_wsprd 
# This file is located in $HOME and calls $HOME/wsprd/utils/wwhelp.sh to display the menu
# ~/wsprd/utils/wsprd-script-list-for-menu.txt
# This file can also be clicked, selection 'execute in terminal' - which will give normal terminal use
# It accepts the menu serial number, which is used to call the appropriate utility script.
# Enter 00 to Exit

clear


while bash $HOME/wsprd/utils/wwhelp.sh

do
	echo
	read -p "please enter menu serial number : "  gmenu
	clear


	if 
		[ -z $gmenu ] # file name is not given, variable is empty
	then
		echo
		echo "You have not entered anything as yet, please try again"
		echo "Press ENTER to continue ..."
		read genpause
		echo
	else
		echo "Menu Selection was : $gmenu"
		case $gmenu in
			1)
				bash $HOME/wsprd/utils/wwlive.sh;;
			2)
				bash $HOME/wsprd/utils/wwping.sh;;
			3)
				bash $HOME/wsprd/utils/wwband.sh;;
			4)
				bash $HOME/wsprd/utils/wwspot.sh;;
			5)
				bash $HOME/wsprd/utils/wwquick.sh;;
			6)
				bash $HOME/wsprd/utils/wwcount.sh;;
			7)
				bash $HOME/wsprd/utils/wwlog.sh;;
			8)
				bash $HOME/wsprd/utils/wwtrack.sh;;
			9)
				bash $HOME/wsprd/utils/wwfreq.sh;;
			10)
				bash $HOME/wsprd/utils/wwtime.sh;;
			11)
				# bash $HOME/wsprd/utils/wwvu.sh;;
				bash $HOME/wsprd/utils/wwcallsign.sh;;
				
			# 12)
				# bash $HOME/wsprd/utils/ww---timesync-CARE.sh;;
			# disabled because ntp is having problems in raspbian bullseye
			# and anyway systemd-timesyncd is taking over it seems
			00)
				echo
				echo
				echo "You have chosen to exit this utility menu for wsprd ..."
				echo "Exiting ..."
				exit;;
			# if 'bash wwmenu.sh' has been used to run this, it will return to the command line,
			# otherwise it will exit the terminal completely
			*)
				echo
				echo "You have entered "
				echo "* ""$gmenu"" *"
				echo "Sorry! This entry is not accepted"
				# echo Please enter Menu numbers 1 to 12, or '00' only
				echo "Please enter Menu numbers 1 to 11, or '00' only"
				echo;;
		esac
	
		echo "Press ENTER to continue ..."
		read genpause

	fi


done

# end of file
