#!/bin/bash
ACTION=$(echo -e "logout\nsuspend\nhibernate\nreboot\nshutdown\ncancel" | rofi -dmenu -p "Shut down computer?")
if [ $ACTION == "logout" ]; then
     i3-msg exit
elif [ $ACTION == "reboot" ]; then
    #gksudo "reboot"
    systemctl reboot
elif [ $ACTION == "suspend" ]; then
    systemctl suspend
elif [ $ACTION == "hibernate" ]; then
    systemctl suspend-then-hibernate
elif [ $ACTION == "shutdown" ]; then
    #gksudo "shutdown -h now"
    systemctl poweroff
fi

