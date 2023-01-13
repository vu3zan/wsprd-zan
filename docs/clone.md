WSPR install - for reception only The GitHub 
repository for the rtlsdr_sdr daemon, by A Guenael 
(RESPECT!), is at  
https://github.com/guenael/rtlsdr_wsprd Follow the 
instructions there to clone it to your raspberry pi. 
It works on a RaspDev rules not being installed, 
install them with _DINSTALL_UDEV_RULES=ONberry Pi 
Zero also. In case you have Raspbian buster, you may 
get some ... errors after the line... If so, modify 
it as .... 2. Building with usfbs zero-copy support 
disabled, use _DENABLE_ZEROCOPY=ON to enable Run the 
rtlsdr_wsprd daemon for a day or so on 40m or 20m. 
Its for reception only, decoding received wspr 
transmissions called 'spots' and uploading to the 
internet. Then check for reception of spots by your 
callsign at www.wspr.rocks or other sites. 3 At the 
end the message was "warning: manually specified 
variables were not used by the project: 
CMAKE_INSTALL_PREFIX My wsprd-zan repository 
provides a utility environment for the rtlsdr_wsprd 
daemon, with band scripts activated through crontab 
for running it, and utility scripts for reports and 
analysis etc. Once the rtlsdr_wsprd daemon is 
running, clone my repository at 
https://github.com/vu3zan/wsprd-zan ... ... ...

cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DDETACH_KERNEL_DRIVER=ON -Wno-dev ..
