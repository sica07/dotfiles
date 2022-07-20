#!/bin/bash
FILE='fsp.json'
URL=$(echo -e "https://www.worldometers.info/coronavirus\nhttps://ecowitt.net\nhttps://app.weathercloud.net/d4081738215#inside\nhttps://www.wunderground.com/personal-weather-station/dashboard?ID=IBRAOV31\nhttps://keep.google.com\nhttps://meteoblue.com\nhttps://trello.com/mariusmatei/boards\nhttps://web.budgetbakers.com/dashboard\napps.jw.org/M_LOGIN1\nhttps://www.jw.org/en/whats-new/\nhttps://wol.jw.org/ro/wol/h/r34/lp-m\nhttps://news.ycombinator.com/best\nhttps://clockify.me/tracker\nhttps://www.digi24.ro/ultimele-stiri\nhttps://hotnews.ro/ultima_ora\nhttps://router.asus.com:8443\nhttp://194.195.241.79:8381\nhttps://archlinux.org\nhttps://aur.archlinux.org\nhttps://archlinux.org/packages\nhttps://translate.google.com/?sl=sv&tl=en&op=translate" | rofi -dmenu -p "Load url:" -config ~/.config/rofi/rofidmenu.rasi)
#firefox -new-tab -url $URL
#firefox --new-tab $URL
luakit -u $URL


