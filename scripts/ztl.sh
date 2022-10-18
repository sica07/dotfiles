#!/bin/bash

FOLDER="/home/marius/MEGA/zettelkasten"
FLEETING="/home/marius/MEGA/vimwiki/Scratch.md"

DATE=$(date +%Y%m%d%H%M%S)
function zetl() {
    title=$(echo "$@" | cut -d" " -f2- )
    title=$(echo "$title" | sed 's/ /-/g')
    title=$FILE-$title
    nvim $ZETL_FOLDER/$title."md"
}
function add() {
    if [[ -n $1 ]]; then
        #remove first word ("add")
        content=$(echo "$@" | cut -d" " -f2- )
        read -p "Referinta/sursa: " src

        echo "\`\`\`$src" >> $FOLDER/$FLEETING
        echo "$content" >> $FOLDER/$FLEETING
        echo "\`\`\`" >> $FOLDER/$FLEETING
    else
        echo "Nothing to save!"
    fi
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
    echo "Manage fleeting notes"
}

case $1 in
  "add")
    add $@;;
  "ls")
    ls;;
  "find")
    find $2;;
  "zetl")
    zetl $@;;
  *)
      help;;
esac
