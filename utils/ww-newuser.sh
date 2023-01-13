#!/bin/bash
#
# Last mod 2023-01-12 by --VU3ZAN Sunil Aruldas
# bash file 'ww-newuser.sh' for Guenael rtlsdr_wsprd
# This will first show existing callsign and grid location (of existing user)
# already written to ~/wsprd/wlogs/wwuser.txt
# It will then ask for new callsign and new grid location
# It will then act on all the band script files and the 
# bandrecord file in ~/wsprd.\,
# changing the existing callsign to the given new callsign, and
# the default grid location to the given new grid location

echo
echo "This is Utility Script '** ww-newuser.sh **' for Guenael rtlsdr_wsprd" 
echo
echo "This will first show existing callsign and grid location "
echo " of default or existing user "
echo " (** Default User : A1XYZ, Default Grid Location : AB12cd **)"
echo
echo "It will then ask for new callsign and new grid location"
echo
echo "It will then act on all the band script related files,"
echo "changing the default callsign to the given new callsign, and"
echo "the default grid location to the given new grid location"
echo 
# checking the details of existing user in ~/wsprd/wlogs/wwuser.txt
existcall=""; existgrid=""
#  while IFS= read -r read_in; do
  while read -r read_in; do
        existgrid="$read_in"
        if [ -z "$existcall" ]; then
                existcall="$existgrid"
        fi
  done < ~/wsprd/wlogs/wwuser.txt
# done < ~/wsprd/wlogs/wwuser.txt
 # for testing with wsprd/wlogs
echo
echo "Existing user callsign : ""$existcall"
echo "Existing user grid location : ""$existgrid"
echo
echo "Do you want to continue [ Type 'YES' in full,"
echo " 		        	anything else Quits this menu item]"
  while [ -z "$gmoveon" ]; do read -p "Entry ?  " gmoveon; echo; done
  if [ "$gmoveon" != "YES" ] 
  then 
    exit
  fi
  # now continues with the script
  

gchoice=""; newcall=""; newgrid=""
while [ "$gchoice" != "YES" ]
do
  echo "Please enter NEW CALLSIGN"
  while [ -z "$newcall" ]; do read -p "Entry ?  " newcall; echo; done
    newcall=$(echo $newcall | tr '[:lower:]' '[:upper:]')
    # call sign in newcall is converted to capitals
  echo "New CallSign is given as : ""$newcall"
  echo
  echo "Please enter NEW GRID LOCATION -- 'AB12cd' format, only first 2 characters in capitals please !"
  while [ -z "$newgrid" ]; do read -p "Entry ?  " newgrid; echo; done
  echo "New Grid Location is given as : ""$newgrid"
  echo
  echo
  echo "Is this OK?   YES in full, or N or Q  -- for yes / no / quit "
  read -p "Entry ?  " gchoice
  gchoice=$(echo $gchoice | tr '[:lower:]' '[:upper:]')
  # call sign in gchoice is converted to capitals
  
  case $gchoice in
      "Q")
	  exit;;
	  # if entry was 'Q', exit this menu item ww-newuser.sh
      "N")
	  echo 
	  echo " Please correct your entries ..."
	  echo "Press any key to continue ..."
	  read gpause
	  newcall=""; newgrid=""
	  echo;;
      "YES")
		#ok
		;;
	*)
	echo
	echo "You have entered * ""$gchoice"" *"
	echo "Please enter YES, N, Q  only"
	echo;;
  esac
done


# It has been confirmed above that new callsign and grid location are to be accepted.
# Now adding one space in front of both callsigns and grid locations
# for correct search and replace
  existcall=" ""$existcall"
  existgrid=" ""$existgrid"
  newcall=" ""$newcall"
  newgrid=" ""$newgrid"
echo
echo "OLD ""*""$existcall""*""$existgrid"" NEW ""*""$newcall""*""$newgrid"

# running the find and replace of existing call & grid  by new ones in ~/wsprd/*

 find "$HOME/wsprd" -maxdepth 1 -type f -name "*.sh" -exec sed -i -e "s/$existcall/$newcall/g" {} \;
echo
echo "User CallSign has been changed from  ""$existcall""  to  ""$newcall" 
echo "------------------------ " >> ~/wsprd/wlogs/wsprd.log
echo "User CallSign has been changed from  ""$existcall""  to  ""$newcall" >> ~/wsprd/wlogs/wsprd.log 

 find "$HOME/wsprd" -maxdepth 1 -type f -name "*.sh" -exec sed -i -e "s/$existgrid/$newgrid/g" {} \;
echo "User Grid Location has been changed from  ""$existgrid""  to  ""$newgrid"
echo "User Grid Location has been changed from  ""$existgrid""  to  ""$newgrid" >> ~/wsprd/wlogs/wsprd.log
echo "$(date)" >> ~/wsprd/wlogs/wsprd.log
# echo >> ~/wsprd/wlogs/wsprd.log

# updating user data to  ~/wsprd/wlogs/wwuser.txt
 echo "$newcall" > ~/wsprd/wlogs/wwuser.txt
 echo "$newgrid" >> ~/wsprd/wlogs/wwuser.txt
 echo "New User CallSign & Grid Location has been written to wwuser.txt"
 echo "New User CallSign & Grid Location has been written to wwuser.txt" >> ~/wsprd/wlogs/wsprd.log
echo "------------------------ " >> ~/wsprd/wlogs/wsprd.log
echo
  # end of file

