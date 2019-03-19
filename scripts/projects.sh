#!/bin/bash
ACTION=$(echo -e "FSP\nMonitive API\nMonitive Frontend\nCentrale\ncancel" | rofi -dmenu -p "Load project:") 
if [ $ACTION == "FSP" ]; then
    FILE='fsp.json'
elif [ $ACTION == "Centrale" ]; then
    FILE='side.json'
elif [ $ACTION == "Monitive API" ]; then
    FILE='api.json'
elif [ $ACTION == "Monitive Frontend" ]; then 
    FILE='web.json'
elif [ $ACTION == "cancel" ]; then 
    exit
fi

xfce4-terminal --working-directory=/home/marius/pCloudDrive/Apps/tmuxp/ -e "/home/marius/.local/bin/tmuxp load $FILE"


