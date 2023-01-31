#!/bin/bash
#
# Last mod 2023-01-26 by VU3*ZAN Sunil Aruldas
# Bash file 'wwping.sh' to check on both network and
# internet connectivity, with 5 pings each
echo
echo "Checking Connectivity : Network as well as Internet"
echo "over a 5 second period each"
echo
echo "Network"
echo
ping -c 5 0
echo
echo "Internet"
echo
ping -c 5 www.google.com
echo

# end of file
