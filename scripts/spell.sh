#!/bin/bash
WORD=$(xclip -selection c -o)

#$(rofi -dmenu -p "Dictionary" -mesg "$(dict -d wn ${WORD})\r\r$(dict -d moby-thesaurus ${WORD})")
$(rofi -dmenu -p "Dictionary" -mesg "$(dict -d wn ${WORD} && wget -q -U Mozilla -O - https://translate.google.com.vn/translate_tts\?ie\=UTF-8\&q\=${WORD}\&tl\=en\&client\=tw-ob | mpg123 - )" -config ~/.config/rofi/rofidmenu.rasi)
