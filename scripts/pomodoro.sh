#!/bin/bash
MINUTES=$(echo -e "" | rofi -dmenu -p "Start pomodoro for: ")

python ~/dotfiles/scripts/pomodoro.py $MINUTES &
