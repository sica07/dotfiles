#!/bin/bash
FILE='fsp.json'
URL=$(echo -e "apps.jw.org/M_LOGIN1\nhttps://www.jw.org/en/whats-new/I\nabout:reader?url=https://wol.jw.org/ro/wol/h/r34/lp-m\nhttps://news.ycombinator.com/best\nhttps://tv.jw.org\nhttps://hangouts.google.com\nhttps://mail.google.com/mail/u/0/h/1c8u8em5k6dh6/?zy=e&f=1\nhttps://app.assembla.com/start\nhttps://toggl.com/app/timer" | rofi -dmenu -p "Load url:") 
firefox -new-tab -url $URL


