Project Name :wsprd-zan
 By Sunil VU3ZAN

This project does not need to be cloned, as it uses only bash scripts and crontab. 
The directory and subdirectory structure must however be maintained

The entire project can be downloaded and installed using the command line as follows :

Log into the Raspberry Pi
cd $HOME
curl -L https://github.com/vu3zan/wsprd-zan/archive/main.tar.gz -o wsprd-zan-setup.tar.gz
# This gives us the compressed file wsprd-zan-setup.tar.gz
tar -xvzf wsprd-zan-setup.tar.gz
# This gives us the full directory structure and all files, with the base directory
# wsprd-zan-setup in the home directory of the user.
mv wsprd-zan-setup wsprd
# This establishes correct name of base directory
cd wsprd
mv wlogs-initial wlogs
# This establishes correct name of reports directory
cd scripts
cp wwaccess ../..
# This copies a useful file wwaccess to the home directory
cd
ls
# There should be a new directory wsprd, and a new file wwaccess.
# The file wwaccess should be green in color as it is an executable file.

### CHECK FOR EXECUTABLE FILES WHEN DOWNLOADING AS SOME OTHER USER.

bash wwaccess
# This sets the path for easy access to the files in the scripts directory.
bash wwmenu
# This runs the utility menu, where actions can be carried out by entering serial numbers.

# Next we have to modify crontab, which is a built in scheduling service.
# The entries in crontab will decide which WSPR band files are run at which time.
# Backup and band rotation is also done through crontab.

# open the file $HOME/wsprd/docs/crontab-any-user.txt and copy the contents
# open crontab as follows --- crontab -e
# scroll to the bottom, give two blank lines, then paste the above into crontab
# exit with saving as follows --- Control-x, y, ENTER
# Now crontab has entries for WSPR band files to be run at certain times

# Now the WSPR program, rtlsdr_wsprd, will start running at the next scheduled time.
# Meanwhile it can be started for, say, the 40 meter bandjust to get things past the initial state.
cd
cd wsprd
./40mF
# Nothing will happen for a few seconds, then the command prompt will reappear.
# Now check the basics
cd
wwmenu
wwlive  # should check that the program is running
wwping  # should check that network is ok
wwband  # should give you details of the WSPR band in operation
# and so on


