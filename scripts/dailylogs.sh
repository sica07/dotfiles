#!/bin/bash

FOLDER="/home/marius/MEGA/dailylogs"

DATE=$(date +%Y%m%d)
FILE="${DATE}_dailylog.md"

function add() {
    if [[ -n $1 ]]; then
        #remove first word ("add")
        content="- "$(echo "$@" | cut -d" " -f2- )
        if [[ -f $FOLDER/$FILE ]]; then
          echo $content >> $FOLDER/$FILE
        else
          echo "#$(date +%F)" > $FOLDER/$FILE
          echo "##Spiritual" >> $FOLDER/$FILE
          echo "##Work" >> $FOLDER/$FILE
          echo $content >> $FOLDER/$FILE
        fi

        bat -p $FOLDER/$FILE
    else
        echo "Nothing to save!"
    fi
}

function open() {
    cd $FOLDER && nvim $FILE
}

function ls() {
  file=$(fd -d 1 . $FOLDER | fzf --sort --preview="cat {}" --preview-window="70%:wrap") &&
	echo "opening $file" &&
	nvim "$file"
}

function find() {
	RG_PREFIX="rga --files-with-matches"
	file="$(
		"$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 3 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	nvim "$file"
}

function help() {
    echo "Manage dailylogs"
}

case $1 in
  "add")
    add $@;;
  "ls")
    ls;;
  "find")
    find $2;;
  *)
    open;;
esac
