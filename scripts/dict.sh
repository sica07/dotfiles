#!/bin/bash
WORD=$(echo -e "" | rofi -dmenu -p "Dictionary ")

$(rofi -dmenu -p "Dictionary" -mesg "$(dict -d wn ${WORD})\r\r$(dict -d moby-thesaurus ${WORD})")
python ~/dotfiles/scripts/pomodoro.py $MINUTES &
