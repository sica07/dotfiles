#!/bin/bash
FILE=~/MEGA/vimwiki/todo.txt
FILE_DONE=~/MEGA/vimwiki/done.txt


function add() {
  if [ -z $2 ]; then
    read -p "Task description: " task
  else
    #task=$(echo "$@" | sed 's/add//')
    task=$(echo "$@" | cut -d" " -f2- )
  fi
  read -p "Task project: " project
  read -p "Task priority (A - D) : " priority
  read -p "Due date (YYYY-mm-dd): " due

  line="$(date +%F) ${task}"

  if [ -n "$priority" ]; then
    line="(${priority}) ${line}"
  fi

  if [ -n "$due" ]; then
    line="${line} due:${due}"
  fi

  if [ -n "$project" ]; then
    line="${line} @${project}"
  fi
  echo $line
  echo -e "${line}\n$(cat $FILE)" > $FILE
  echo "Task added!"
}

function list(){
  echo ""
  echo ""
  cat $FILE | nl -w2 -s"| "
  echo ""
  echo ""
}

function mark_done() {
  if [ -z $1 ]; then
    read -p "Mark as done task number: " linenr
  else
    linenr=$1
  fi
  echo "Marking task $linenr as DONE ..."
  sed -i "${linenr} s/^/x $(date +%F) /" $FILE
  echo $(sed -n "${linenr}p" $FILE)
  echo -e "$(sed -n ${linenr}p $FILE)\n$(cat $FILE_DONE)"  > $FILE_DONE
  sed -i "${linenr}d" $FILE
}

function remove() {
  read -p "Are you sure you want to remove the task? (Y/n)" confirm

  case $confirm in
    "Y"|"y")
      if [ -z $1 ]; then
        read -p "Remove task number: " linenr
      else
        linenr=$1
      fi
      echo "Removing task $linenr ..."
      sed -i "${linenr}d" $FILE
      list;;
    *)
      exit 0;;
  esac

}

function help() {
  echo "TODO usage:"
  echo "t [command] [argument]"
  echo ""
  echo "Commands:"
  echo "list,ls - list all todos"
  echo "remove,rm [task nr]- remove/delete a task from the list"
  echo "add [description of the task] - add a task to the list. You may provide the description right after the command or just hit enter and added after that"
  echo "done,x [task nr]- mark a task as done"
}

case $1 in
  "ls"|"list")
    list;;
  "add")
    add $@;;
  "done"|"x")
    mark_done $2;;
  "remove"|"rm")
    remove $2;;
  *)
    help;;
esac

