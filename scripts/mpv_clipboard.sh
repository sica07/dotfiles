#!/bin/bash
mpv -vo=gpu --hwdec=vaapi $(xclip -selection c -o)
