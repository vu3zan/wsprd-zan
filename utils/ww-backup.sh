#!/bin/bash
#
# Last mod 2023-02-22 by VU3*ZAN Sunil Aruldas
# bash file 'ww-backup.sh' for Guenael wsprd current log ~/wsprd/wlogs/wsprd.log 
# to update 8 sequential bucket backups (~/wsprd/wlogs/backups/b1.log to 8), 
# triggered by crontab at 9.55am every day
# Create a record of latest backup in ~/wsprd/wlogs/wwlatestbackup.txt
# and run ntp time synchronization# Create a record of latest backup in wwlatestbackup.txt
# and also add the valid & invalid WSPR spots found in the latest log file (here b1.log after backups)
# to cumulative logs wwvalidlist.log & wwinvalidlist.log
# Also backup ~/wsprd/wlogs wwvalidlist.log, wwinvalidlist.log, wspruser.tx, wwlatestbackup.txt
# Initialize the wsprd.log, wsprband.txt and wsprbandtime.txt files
# Also copy certain logs/reports to ~/wsite/docs for viewing through browser using nginx & dataplicity porthole 

# recovering description of previous band
    echo $'\n'"----------------------------------------------" >> ~/wsprd/wlogs/wsprd.log 
    prevfile="$HOME/wsprd/wlogs/wsprband.txt"
    # In the above line the tilde ~ is replaced by $HOME for use in the variable
    while read -r prev_item
    do
        # writing description of previous band to wsprd.log
        echo "$prev_item" >> ~/wsprd/wlogs/wsprd.log 
    done < "$prevfile"
    
# recovering time of activation of previous band
    prevfile="$HOME/wsprd/wlogs/wsprbandtime.txt"
    while read -r prev_item
    do
        # writing time of activation of previous band to wsprd.log
        echo "$prev_item" >> ~/wsprd/wlogs/wsprd.log 
    done < "$prevfile"

# NOTE: The running rtlsdr_wsprd session for previous band needs to be killed before backups.
 # Since this causes it to dump all records of previous band to the wsprd.log file, the activation time 
 # and name of previous band need to be written to the file first, which has been taken care of above.

# first kill any rtlsdr_wsprd daemon that may be running, to avoid possible problems
	pgrep rtlsdr_wsprd > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			killall rtlsdr_wsprd &>> ~/wsprd/wlogs/wsprd.log
        fi
    sleep 15
# the above gives time for the kill process to terminate successfully

# Now the records of last used band will have been dumped to the log file.

# now record the time of this backup separately as a check for the ** administrator **
echo "Time of latest backup taken for Utility Environment for Guenael rtlsdr_wsprd" >  ~/wsprd/wlogs/wwlatestbackup.txt 
date >> ~/wsprd/wlogs/wwlatestbackup.txt 

# Synchronize the system time with NTP, once a day
#	sudo timedatectl set-ntp true
    
# grep NTP /var/log/syslog > ~/wsprd/wlogs/temp.txt && \
# tail ~/wsprd/wlogs/temp.txt >> ~/wsprd/wlogs/wwlatestbackup.txt && \
# rm ~/wsprd/wlogs/temp.txt && cat ~/wsprd/wlogs/wwlatestbackup.txt 

#### CARE CARE CARE -- it seems in raspbian bullseye the systemd-timesyncd is favoured over ntp
# sudo timedateclt set-ntp true sometimes gives "Failed to set ntp. ntp not supported"
# and anyway systemd-timesyncd is taking over it seems
# ALSO NOWADAYS SUDO REQUIRES PASSWORD SO THE SCRIPT COMMAND DOES NOT RUN AND THUS NO LOG ENTRY ALSO
# HENCE this time synchronization IS DISABLED 

# SEQUENTIAL BUCKET BACKUPS -- total 8 backups
# First delete oldest file i.e b8.log. 
# Next rename 2nd oldest as oldest i.e b7.log as b8.log, and so on.
# Lastly rename wsprd.log as b1.log and later create a new wsprd.log with a heading line
rm ~/wsprd/wlogs/backups/b8.log
sleep 2
mv ~/wsprd/wlogs/backups/b7.log  ~/wsprd/wlogs/backups/b8.log
sleep 2
mv ~/wsprd/wlogs/backups/b6.log  ~/wsprd/wlogs/backups/b7.log
sleep 2
mv ~/wsprd/wlogs/backups/b5.log  ~/wsprd/wlogs/backups/b6.log
sleep 2
mv ~/wsprd/wlogs/backups/b4.log  ~/wsprd/wlogs/backups/b5.log
sleep 2
mv ~/wsprd/wlogs/backups/b3.log  ~/wsprd/wlogs/backups/b4.log
sleep 2
mv ~/wsprd/wlogs/backups/b2.log  ~/wsprd/wlogs/backups/b3.log
sleep 2
mv ~/wsprd/wlogs/backups/b1.log  ~/wsprd/wlogs/backups/b2.log
sleep 2
mv ~/wsprd/wlogs/wsprd.log  ~/wsprd/wlogs/backups/b1.log
sleep 2

# sleep 2 seconds is to make sure the renaming is over

# Now backs up the old ~/wsprd/wlogs/wwvalidlist.log  and ~/wsprd/wlogs/wwinvalidlist.log to backups folder
cp ~/wsprd/wlogs/wwvalidlist.log ~/wsprd/wlogs/backups/
cp ~/wsprd/wlogs/wwinvalidlist.log ~/wsprd/wlogs/backups/
# Now backs up the old ~/wsprd/wlogs/wspruser.txt to backups folder
cp ~/wsprd/wlogs/wspruser.txt ~/wsprd/wlogs/backups/
# Now backs up the old ~/wsprd/wlogs/wwlatestbackup.txt to backups folder
cp ~/wsprd/wlogs/wwlatestbackup.txt ~/wsprd/wlogs/backups/

# now adds valid wspr entries found in latest backup b1.log
# (i.e. ~/wsprd/wlogs/backups/b1.log) to ~/wsprd/wlogs/wwvalidlist.log
grep 'Spot :' ~/wsprd/wlogs/backups/b1.log | grep -v -E "A000AA|<...>" >> ~/wsprd/wlogs/wwvalidlist.log
echo "**Recorded on : " "$(date)" >> ~/wsprd/wlogs/wwvalidlist.log

# now adds invalid wspr entries found in latest backup b1.log to ~/wsprd/wlogs/wwinvalidlist.log
# grep -E '<...>' ~/wsprd/wlogs/backups/b1.log | grep -v 'A000AA' >> ~/wsprd/wlogs/wwinvalidlist.log
grep -E "<...>|A000AA" ~/wsprd/wlogs/backups/b1.log >> ~/wsprd/wlogs/wwinvalidlist.log
# echo "Date for the set of above records : " "$(date)" >> ~/wsprd/wlogs/wwinvalidlist.log
echo "**Recorded on : " "$(date)" >> ~/wsprd/wlogs/wwinvalidlist.log

# now create new wsprd.log file with a heading line
echo "Log File for Guenael rtlsdr_wsprd" >  ~/wsprd/wlogs/wsprd.log
echo "For the FILE VIEWER, f / b / q = forward / backward / quit"  >> ~/wsprd/wlogs/wsprd.log 
# date >> ~/wsprd/wlogs/wsprd.log # duplicated soon anyway

# Now the existing "$HOME/wsprd/wlogs/wsprband.txt & wsprbandtime.txt" need to be initialized for new log opened.
# Using same coding as for band scripts, for uniformity
    curr_band="NEW LOG FILE NOW OPENED" 
    echo "$curr_band" > ~/wsprd/wlogs/wsprband.txt
# recording time of current band activation for use when the next band is activated
    echo "$(date)" > ~/wsprd/wlogs/wsprbandtime.txt  

# Update script for providing docs for ~/wsite/docs for viewing through browser using dataplicity porthole
# Note : ALL CONVERTED TO HTML FILES
# only for system where website "~/WSITE" is there !!!
if [[ -f "$HOME/wsite/index.html" ]];
 then
    # cp ~/wsprd/wlogs/wsprband.txt ~/wsite/docs/
    # cp ~/wsprd/wlogs/wspruser.txt ~/wsite/docs/
    # cp ~/wsprd/wlogs/wwlatestbackup.txt ~/wsite/docs/
    # cp ~/wsprd/wlogs/wwvalidlist.log ~/wsite/docs/wwvalidlist.txt
    # tail -n 50 ~/wsprd/wlogs/wwvalidlist.log > ~/wsite/docs/wwvalid.txt
    # cp ~/wsprd/wlogs/wwinvalidlist.log ~/wsite/docs/wwinvalidlist.txt
    # cp ~/wsprd/wlogs/wsprd.log ~/wsite/docs/wsprd.txt
    # cp ~/wsprd/wlogs/backups/b1.log ~/wsite/docs/b1.txt
    # viewing the crontab schedule
    # replaced by html conversion
    
    conv2html="wsprband"
     ( . $HOME/wsite/appn1/makehtml.sh )
    conv2html="wspruser"
     ( . $HOME/wsite/appn1/makehtml.sh )
    conv2html="wwlatestbackup"
     ( . $HOME/wsite/appn1/makehtml.sh )
    conv2html="wwvalidlist"
     ( . $HOME/wsite/appn1/makehtml.sh )
    conv2html="wwvalid50"
     ( . $HOME/wsite/appn1/makehtml.sh )
    conv2html="wwinvalidlist"
     ( . $HOME/wsite/appn1/makehtml.sh )
    conv2html="wsprd"
     ( . $HOME/wsite/appn1/makehtml.sh )
     conv2html="b1"
     ( . $HOME/wsite/appn1/makehtml.sh )
    conv2html="wwschedule"
     ( . $HOME/wsite/appn1/makehtml.sh )

#   conv2html="b1"
#     ( . $HOME/wsite/appn1/makehtml.sh )
    
fi


# end of file
