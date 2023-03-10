#!/bin/bash
#
# Last mod 2023-01-26 by VU3*ZAN Sunil Aruldas
# bash file 'ww---timesync-CARE.sh' for Guenael wsprd log 

# Synchronizing the RPi with an international timer server is necessary for correct running of WSPR.
# This is done once a day during backups at 9.55am, through the script ~/wsprd/utils/ww-backup.sh 

# However synchronization may be necessary when starting the computer after a long period of inactivity,
# or in case the time is in doubt. 
# Hence this script has been prepared for use.

#### CARE CARE CARE -- it seems in raspbian bullseye the systemd-timesyncd is favoured over ntp
# sudo timedateclt set-ntp true gives "Failed to set ntp. ntp not supported"
# and anyway systemd-timesyncd is taking over it seems
# Hence this time synchronization has been disabled in the ~/wsprd/utils/ww-backup.sh file 

echo Synchronizing the RPi with an international timer server is necessary for correct running of WSPR.
echo This is done once a day during backups at 9.55am, through the script ~/wsprd/scripts/ww-backups .

echo However synchronization may be becessary when starting the computer after a long period of inactivity,
echo or in case the time is in doubt. 
echo Hence this script has been prepared for use.
echo
echo The timesync process will take a few seconds, during which the screen may go blank
echo
echo Pl Note: The rtlsdr-wsprd process will be terminated if it is running,
echo and will have to be restarted manually later [or wait until auto restarted as per schedule]
echo
 echo Press ENTER to continue ... [ Ctrl-C to abort !! ]
 read genpause
 echo
# first kill any rtlsdr_wsprd daemon that may be running, to avoid possible problems
	pgrep rtlsdr_wsprd > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		killall rtlsdr_wsprd &>> ~/wsprd/wlogs/wsprd.log
        fi
	sleep 15
# the above gives time for the kill process to terminate successfully
echo The rtlsdr-wsprd process, if it was running, has been terminated
echo
echo Now synchronizing the time ... this will take a few seconds, the screen may go blank
echo
# Synchronize the system time with ntp
	sudo timedatectl set-ntp true
echo
echo IF NO FAILURE MESSAGE IS SEEN ON SCREEN, 
echo 		THEN THE SYSTEM TIME HAS BEEN  SYNCHRONIZED WITH NTP
# syslog entry for last few NTP activations saved to 
grep NTP /var/log/syslog 

# end of file
