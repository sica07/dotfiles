#!/bin/bash
WORD=$(echo -e "" | rofi -dmenu -p "Dictionary " -config ~/.config/rofi/rofidmenu.rasi)

#$(rofi -dmenu -p "Dictionary" -mesg "$(dict -d wn ${WORD})\r\r$(dict -d moby-thesaurus ${WORD})")
$(rofi -dmenu -p "Dictionary" -mesg "$(dict -d wn ${WORD})" -config ~/.config/rofi/rofidmenu.rasi)
