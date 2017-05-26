#!/bin/bash

clear

a=/etc/gdm/PostLogin/Default

set e

# Check that the script is being run as root.
if [[ $(id -u) != 0 ]]; then
	echo "Please run this script with root privileges."
	exit 0
fi

echo "This script remove the annoing issue of the double shell:"
echo "one is your user and other is gdm user ( zombie shell )"
echo "WARNING(!) the autologin not work with this applied"
echo "see here for more info"
echo "https://bugzilla.gnome.org/show_bug.cgi?id=782832"
echo

echo "Press (O)k to continue or (N)o to cancel"
echo

read choice
echo
case "$choice" in 
	 "O" | "o" )
	 touch $a
	 echo "pkill -KILL -u gdm" >> $a
	 chmod 755 $a
	 echo
	 echo "Logout and Login for apply and you have finished" 
	 ;;
	 * )
	 echo "Nothing change"
	 ;;
esac

exit 0

