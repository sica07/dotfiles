#!/bin/bash
FILE='fsp.json'
ACTION=$(echo -e "FSP\nMonitive API\nMonitive Frontend\ncancel" | rofi -dmenu -p "Load project:") 
if [ $ACTION == "FSP" ]; then
    $FILE='fsp.json'
elif [ $ACTION == "Monitive API" ]; then
    $FILE='api.json'
elif [ $ACTION == "Monitive Frontend" ]; then 
    $FILE='web.json'
elif [ $ACTION == "cancel" ]; then 
    exit
fi

cd ~/Dropbox/Apps/tmuxp && tmuxp load $FILE


