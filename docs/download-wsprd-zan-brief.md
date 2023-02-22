	DOWNLOAD-WSPRD-ZAN-BRIEF.MD
 Project Name :wsprd-zan
 By Sunil VU3*ZAN

Last mod 2023-02-20

This wsprd-zan repository provides a Utility Environment for the rtlsdr_wsprd daemon, 
Downloading is enough as the project uses only bash scripts and crontab. 

[A]
DOWNLOADING & INSTALLATION

	cd $HOME
	curl -L https://github.com/vu3zan/wsprd-zan/archive/main.tar.gz -o wsprd-zan-setup.tar.g

	tar -xvzf wsprd-zan-setup.tar.gz
	mv wsprd-zan-setup wsprd

	cd wsprd
	mv wlogs-sample wlogs

	cd utils
	cp wwmenu.sh $HOME

	cd
	ls
# There should be a new directory wsprd, and a new file wwmenu.sh for running the menu.
# This file wwmenu.sh should be green in color as it is an executable file.


[B]
SCHEDULING FOR WSPR BAND CHANGE

# Open the file $HOME/wsprd/docs/crontab-any-user.txt, select all and copy the contents.
# Open crontab as follows --- 
	crontab -e
# Scroll to the bottom, give two blank lines, then paste the above contents into crontab.
# Then Exit with saving as follows --- Control-x, y, ENTER.

# The WSPR program, rtlsdr_wsprd, will start running at the next scheduled time.
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

	
