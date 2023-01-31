#!/bin/bash
#
# Last mod 2023-01-26 by VU3*ZAN Sunil Aruldas
# bash file 'wwlive.sh' for Guenael rtlsdr_wsprd running in ~/rtlsdr-wsprd/
# to show process service output for this file and for the crontab scheduling service
# and to thus know whether they are running

# ps -C  rtlsdr_wsprd
echo

echo "Checking if the wsprd program for WSPR is active (rtlsdr_wsprd)."
echo "If one PID number is shown below, it is active, otherwise not :"
# echo "1---"
# pgrep rtlsdr_wsprd
# echo "2---"
# ps aux | grep rtlsdr_wsprd
# echo "3---"
ps -C rtlsdr_wsprd
echo
echo "  [NOTE: Only ONE number under PID should be seen. Otherwise there may be" 
echo "    two or more instances of rtlsdr_wsprd  interfering with one another !"
echo "      Check using htop and, if there are multiple numbers under PID, Reboot the RPi]"
echo "--------"
echo
echo "Checking if the crontab scheduler, which controls band scheduling job for WSPR, is active (cron)."
echo "If a PID number is shown below, it is active, otherwise not :"
# echo "1---"
# pgrep cron
# echo "2---"
# ps aux | grep rtlsdr_wsprd
# echo "3---"
ps -C cron
echo "  [In this case if more than one number under PID is seen, no problem, because other services may also be scheduled]"
echo
echo "  Please ignore the TTY column in both cases."
echo

# end of program
