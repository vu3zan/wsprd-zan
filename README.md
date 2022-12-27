Project Name :wsprd-zan
By Sunil VU3ZAN

This project makes use of the rtlsdr_wsprd daemon by Guenael on Github
to receive WSPR spots [RESPECT!] using a Raspberry Pi.

The project tries to provide a kind of utility environment for the rtlsdr_wsprd daemon.
It contributes scripts to use the wsprd daemon on various bands,
with provision for changing bands using crontab, while generating a log ($HOME/wsprd/wlogs/wsprd.log). 
A simple system of band rotation is implemented by simply renaming the band scripts which are referred to by crontab.
Utility scripts are also provided in $HOME/wsprd/scripts for report generation from log, for backups, and for
other activities.

Version 1 used the wsprd daemon for fixed bands, using the tmux session utility.
Version 2 introduced band changing with the help of crontab. The utility scripts were kept separately in $HOME/bin.
Version 3 now has brought all files and folders under a single folder $HOME/wsprd, and uses git and github for version control. 
