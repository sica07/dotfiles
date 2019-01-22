#!/bin/bash
ACTION=$(echo -e "logout\nreboot\nshutdown\ncancel" | rofi -dmenu -p "Shut down computer?") 
if [ $ACTION == "logout" ]; then
     i3-msg exit
elif [ $ACTION == "reboot" ]; then
    gksudo "reboot"
elif [ $ACTION == "shutdown" ]; then 
    gksudo "shutdown -h now"
fi

