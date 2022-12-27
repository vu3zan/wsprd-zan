Project Name :wsprd-zan
By Sunil VU3ZAN

This project makes use of the rtlsdr_wsprd daemon by Guenael on Github
to receive WSPR spots [RESPECT!]on a Raspberry Pi.

The project tries to provide a kind of utility environment for the rtlsdr_wsprd daemon.
It contributes scripts to use the wsprd daemon on various bands,
with provision for changing bands using crontab, while generating a log $HOME/wsprd/wlogs/wsprd.log. 
A simple system of band rotation is implemented by simply renaming the band scripts which are referred to be crontab.
Utility scripts are also provided in $HOME/wsprd/scripts for report generalion from log, backups, and
other activities.

Version 1 used the wsprd daemon for fixed bands with tmux.
Version 2 introduced band changing with the help of crontab. The utility scripts were in $HOME/bin.
Version 3 now has all files under a single folder $Home/wsprd, and used git and github. 
