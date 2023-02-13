#!/bin/bash
#
# Last mod 2023-02-08 by VU3*ZAN Sunil Aruldas
# bash file 'wwhelp.sh' for Guenael rtlsdr_wsprd utility scripts in ~/wsprd/utils
# to list them with a short description of each, for use with wwmenu.sh script,
# by displaying the file ~/wsprd/utils/wsprd-script-list-for-menu.txt

  cat ~/wsprd/utils/wsprd-script-list-brief2.txt
# brief menu  suitable for moblie screen also  :-)


# read user data from ~/wsprd/wlogs/wspruser.txt and print it
genfile="$HOME/wsprd/wlogs/wspruser.txt"
    ham_details=""
    while read -r read_in
    do
	ham_details="$ham_details""     ""$read_in"
    # workaround to read two lines and get them into one variable 
    done < "$genfile"

 echo "    ***""$ham_details""   ***"
 echo "----------------------------------------"

 exit
# end of file
