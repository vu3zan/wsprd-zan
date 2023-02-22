	DOWNLOAD-WSPRD-ZAN.MD
Project Name :wsprd-zan
 By Sunil VU3*ZAN

Last mod 2023-02-20 

This wsprd-zan repository provides a Utility Environment for the rtlsdr_wsprd daemon, 
with band scripts activated through crontab, and utility scripts for logs/reports/analysis.

Although the project can be cloned, that is not necessary. Downloading is enough as the project
uses only bash scripts and crontab. 

[A]
DOWNLOADING & INSTALLATION

# Turn the Raspberry Pi on, logging in if necessary
	cd $HOME
	curl -L https://github.com/vu3zan/wsprd-zan/archive/main.tar.gz -o wsprd-zan-setup.tar.gz
# This gave us the compressed file "wsprd-zan-setup.tar.gz".

# Installation is as follows :
	tar -xvzf wsprd-zan-setup.tar.gz
# This gave us the full directory structure and all files, with a base directory called
# "wsprd-zan-setup" in the home directory of the user. This name has to be changed.
	mv wsprd-zan-setup wsprd
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

See operations.md for further instructions
--------------------------------------------

