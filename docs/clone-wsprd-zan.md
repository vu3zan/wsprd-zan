     CLONE-WSPRD-ZAN.MD
 Project Name :wsprd-zan
 By Sunil VU3*ZAN
 
Last mod 2023-02-20 

This wsprd-zan repository provides a utility environment 
for the rtlsdr_wsprd daemon, with band scripts activated 
through crontab for running it, and utility scripts 
for reports and analysis etc.

For cloning the repository, the "git" software is necessary.
If you are using raspbian for the Raspberry Pi, then this is already installed.
If you are using some other linux distro, please look up and follow instructions on installing git.

#A]
CLONING & INSTALLATION

# Turn the Raspberry Pi on, logging in if necessary
	cd $HOME
	git clone https://github.com/vu3zan/wsprd-zan
# This gave us the full directory structure and all files, with a base directory called
# "wsprd-zan" in the home directory of the user. This name has to be changed.
	mv wsprd-zan wsprd
# This established the correct name "wsprd" of the base directory.
	cd wsprd
	mv wlogs-sample wlogs
# This established the correct name "wlogs" of the logs directory.
# For information, initial log, report and backup files are already provided in the wlogs directory.
	cd utils
	cp wwmenu.sh $HOME
# This copied the menu activation file wwmenu.sh to the home directory.
	cd
	ls
# There should be a new directory wsprd, and a new file wwmenu.sh
# This file wwmenu.sh should be green in color as it is an executable file.


[B]
SCHEDULING FOR WSPR BAND CHANGE

# We have to modify crontab, which is a Linux built-in scheduling service.
# The entries in crontab will decide which WSPR band files are to be run at which time.
# Backup and band rotation is also done through crontab.

# Open the file $HOME/wsprd/docs/crontab-any-user.txt, select all and copy the contents.
# Open crontab as follows --- 
	crontab -e
# Scroll to the bottom, give two blank lines, then paste the above contents into crontab.
# Then Exit with saving as follows --- Control-x, y, ENTER.
# Now crontab has scheduling entries for WSPR band files to be run at certain times.

# As a result the WSPR program, rtlsdr_wsprd, will start running at the next scheduled time.
# Meanwhile it can be started for, say, the 40 meter band just to get things moving.
	cd
	cd wsprd
	./40mF.sh
# Nothing will happen for a few seconds, then the command prompt will reappear.
	cd
# Scheduling is over
# Note that the contents can be modified at any time by running "crontab -e" again.

--------------------------------------------
