#!/usr/bin/env bash

# Simple calculator script
# Use it by adding a new mode, e.g.:
# rofi -show run -modi calc:../Examples/rofi-calculator.sh
CLIP_HISTORY_FILE=~/.local/share/rofi/rofi_clipboard_history
CLIP_HISTORY_LENGTH=50 # maximum number of history entries

# Create the directory for the files of the script
if [ ! -d $(dirname "${CLIP_HISTORY_FILE}") ]
then
    mkdir -p "$(dirname "${CLIP_HISTORY_FILE}")"
fi

$(rofi -demnu -p "Clipboard" -mesg "$(greenclip print)")
