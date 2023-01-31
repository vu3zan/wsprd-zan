#!/bin/bash
#
# Last mod 2023-01-26 by VU3*ZAN Sunil Aruldas
# bash file 'ww-kill-rtlsdr.sdr' for Guenael rtlsdr_wsprd running in ~/rtlsdr-wsprd/
# to STOP the running of the rtlsdr_wsprd process(es)

sudo killall rtlsdr_wsprd
echo "  ## WSPRD PROCESS TERMINATED  ## " 
echo "( until next activation, either manually or by the crontab scheduling service )"

# end of file
