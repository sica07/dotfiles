#!/bin/bash

ACTION=$(echo -e "DuckDuckGo\ngoogle\nstackoverflow\nwikipedia\ngithub\nwolframalpha\nperspicacitate\ninsight" | rofi -dmenu -p "Search:" -config ~/.config/rofi/rofidmenu.rasi)
if [ $ACTION == "DuckDuckGo" ]; then
    luakit -u https://duckduckgo.com/?q=+$(echo $(rofi -dmenu -p search: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')
elif [ $ACTION == "google" ]; then
    luakit -u https://duckduckgo.com/?q=!g+$(echo $(rofi -dmenu -p google: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')
elif [ $ACTION == "stackoverflow" ]; then
    luakit -u https://duckduckgo.com/?q=!stackoverflow+$(echo $(rofi -dmenu -p stackoverflow: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')
elif [ $ACTION == "wikipedia" ]; then
    luakit -u https://duckduckgo.com/?q=!w+$(echo $(rofi -dmenu -p google: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')
elif [ $ACTION == "github" ]; then
    luakit -u https://github.com/search?q=+$(echo $(rofi -dmenu -i -p github: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')
elif [ $ACTION == "wolframalpha" ]; then
    luakit -u https://duckduckgo.com/?q=!wa+$(echo $(rofi -dmenu -p google: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')
elif [ $ACTION == "insight" ]; then
    luakit -u https://duckduckgo.com/?q=!wol+$(echo $(rofi -dmenu -p google: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')
elif [ $ACTION == "perspicacitate" ]; then
    luakit -u https://wol.jw.org/ro/wol/s/r34/lp-m?q=+$(echo $(rofi -dmenu -i -p wol-m: -config ~/.config/rofi/rofidmenu.rasi) | sed 's/ /%20/g')
fi



