#!/bin/bash
FILE='fsp.json'
ACTION=$(echo -e "DuckDuckGo\ngoogle\nstackoverflow\nwikipedia\ngithub\wolframalpha\nperspicacitate\ninsight" | rofi -dmenu -p "Search:" -config ~/.config/rofi/rofidmenu.rasi)
if [ $ACTION == "DuckDuckGo" ]; then
    $TERMINAL -e "luakit https://duckduckgo.com/?q=+$(echo $(rofi -dmenu -p search: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')"
elif [ $ACTION == "google" ]; then
    $TERMINAL -e "luakit https://duckduckgo.com/?q=!g+$(echo $(rofi -dmenu -p google: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')"
elif [ $ACTION == "stackoverflow" ]; then
    $TERMINAL -e "luakit https://duckduckgo.com/?q=!stackoverflow+$(echo $(rofi -dmenu -p stackoverflow: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')"
elif [ $ACTION == "wikipedia" ]; then
    $TERMINAL -e "luakit https://duckduckgo.com/?q=!w+$(echo $(rofi -dmenu -p google: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')"
elif [ $ACTION == "wolframalpha" ]; then
    $TERMINAL -e "luakit https://duckduckgo.com/?q=!wa+$(echo $(rofi -dmenu -p google: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')"
elif [ $ACTION == "insight" ]; then
    $TERMINAL -e "luakit https://duckduckgo.com/?q=!wol+$(echo $(rofi -dmenu -p google: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')"
elif [ $ACTION == "perspicacitate" ]; then
    $TERMINAL -e "https://wol.jw.org/ro/wol/s/r34/lp-m?q=+$(echo $(rofi -dmenu -i -p wol-m: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')"
    exit
fi



