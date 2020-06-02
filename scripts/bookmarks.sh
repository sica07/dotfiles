#!/bin/bash
FILE='fsp.json'
URL=$(echo -e "https://www.worldometers.info/coronavirus\nhttps://app.weathercloud.net/d4081738215#inside\nhttps://www.wunderground.com/personal-weather-station/dashboard?ID=IBRAOV31\nhttps://web.budgetbakers.com/dashboard\napps.jw.org/M_LOGIN1\nhttps://www.jw.org/en/whats-new/\nhttps://wol.jw.org/ro/wol/h/r34/lp-m\nhttps://news.ycombinator.com/best\nhttps://clockify.me/tracker\nhttps://www.digi24.ro/ultimele-stiri\nhttps://hotnews.ro/Ultima_ora\nhttps://router.asus.com:8443\nhttp://localhost:7900" | rofi -dmenu -p "Load url:")
#firefox -new-tab -url $URL
surf $URL


