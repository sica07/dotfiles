#!/bin/bash
FILE='fsp.json'
URL=$(echo -e "https://app.weathercloud.net/d4081738215#inside\nhttps://www.wunderground.com/personal-weather-station/dashboard?ID=IBRAOV31\nhttps://web.budgetbakers.com/dashboard\napps.jw.org/M_LOGIN1\nhttps://www.jw.org/en/whats-new/I\nabout:reader?url=https://wol.jw.org/ro/wol/h/r34/lp-m\nhttps://news.ycombinator.com/best\nhttps://tv.jw.org\nhttps://hangouts.google.com\nhttps://mail.google.com/mail/u/0/h/1c8u8em5k6dh6/?zy=e&f=1\nhttps://app.assembla.com/start\nhttps://toggl.com/app/timer\nhttps://router.asus.com:8443\nhttp://192.168.1.20/cmh/#devices" | rofi -dmenu -p "Load url:") 
firefox -new-tab -url $URL


