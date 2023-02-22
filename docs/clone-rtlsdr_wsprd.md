     CLONE-RTLSDR-WSPRD.MD
 Project Name :wsprd-zan
 By Sunil VU3*ZAN
 
 Last mod 2023-02-20
 
The GitHub repository for the rtlsdr_sdr daemon, 
by A Guenael VA2GKA(RESPECT!), is at  
https://github.com/guenael/rtlsdr_wsprd. The design
is for reception only. Follow the instructions there 
to clone it to your Raspberry Pi. It works well even on a 
Raspberry Pi Zero. 

--------------------------------------------

In case you have the Raspbian bullseye OS, you may 
get some errors after the line
"cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DDETACH_KERNEL_DRIVER=ON -Wno-dev .."

     "1. Dev rules not being installed, 
     install them with _DINSTALL_UDEV_RULES=ON 
     2. Building with usfbs zero-copy support 
     disabled, use _DENABLE_ZEROCOPY=ON to enable 
     3. At the end the message was "warning: manually 
     specified variables were not used by the project: 
     CMAKE_INSTALL_PREFIX "

If these messages are seen, please modify the original line, 
adding the pieces of code suggested in the middle, 
as follows:
"cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr _DINSTALL_UDEV_RULES=ON _DENABLE_ZEROCOPY=ON -DDETACH_KERNEL_DRIVER=ON -Wno-dev .."

--------------------------------------------

Run the rtlsdr_wsprd daemon for a day or so on 
40m or 20m. It decodes received WSPR transmissions 
called 'spots' and uploading to the internet. Then 
check for reception of spots by your callsign at 
www.wspr.rocks or other sites.  

Once the rtlsdr_wsprd daemon is running, take steps
to obtain my repository at 
https://github.com/vu3zan/wsprd-zan 
This wsprd-zan repository provides a Utility Environment 
for the rtlsdr_wsprd daemon, with band scripts activated 
through crontab for running it, and utility scripts 
for reports and analysis etc.

--------------------------------------------

You can either CLONE or DOWNLOAD the wsprd-zan repository.
For cloning instructions, see 'clone-wsprd-zan.md'
For downloading instructions, see 'download-wsprd-zan.md' or download-wsprd-zan-brief.md'

--------------------------------------------
