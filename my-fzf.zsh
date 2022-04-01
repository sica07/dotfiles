export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export FZF_COMPLETION_TRIGGER='``'
export FZF_DEFAULT_OPTS="--height 70% --reverse --extended --no-inline-info
--prompt '➥ '
--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
--color info:150,prompt:168,spinner:150,pointer:167,marker:174"
#Jellyx
#--prompt '➤ ➥ ➢ ➠ ➜ ➛'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

#Jellybean color theme
#--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
#--color info:183,prompt:110,spinner:107,pointer:167,marker:215
#Molokai
#--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
#--color info:144,prompt:161,spinner:135,pointer:135,marker:118
#Dusk
#--color fg:242,bg:233,hl:65,fg+:15,bg+:239,hl+:108
#--color info:108,prompt:109,spinner:108,pointer:168,marker:168

# #####################GIT GOODIES###################
# KEYBINDINGS <C-G><C-F>, <C-G><C-H>, <C-G><C-R>, <C-G><C-B>, <C-G><C-T>
# ####################################################
# Described in:
# - https://junegunn.kr/2016/07/fzf-git/
# - https://github.com/junegunn/fzf/wiki/examples#git
# Will return non-zero status if the current directory is not managed by git
# GIT heart FZF
#
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}
# -------------


fzf-down() {
  fzf --height 90% "$@" --border
}

FZF_PREFIX="fzf-git-"

function "${FZF_PREFIX}gs" () {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

function "${FZF_PREFIX}gb" () {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

# git tag
function "${FZF_PREFIX}gt" () {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

function "${FZF_PREFIX}gh" () {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(blue)%an %C(auto)%h %s" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview-window right:40% \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

function "${FZF_PREFIX}gr" () {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local char
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(${FZF_PREFIX}g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}

bind-git-helper f b t r h
unset -f bind-git-helper
###################END OF GIT GOODIES###################

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vv() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     nvim -- $files
     print -l $files[1]
  fi
}
zle     -N   fdh
bindkey '^v' fdh

# fd - including hidden directories
fdh() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
  zle redisplay
}
zle     -N   fdh
bindkey '^j' fdh

# fk - kill process
fk() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
  zle redisplay
}
zle     -N   fk
bindkey '^k' fk

# ALT-I - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
  local selected
  if selected=$(locate / | fzf -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N    fzf-locate-widget
bindkey '\ei' fzf-locate-widget

# fe - open files in ~/.viminfo
fe() {
  local files
  files=$(grep '^>' ~/.viminfo | cut -c3- |
          while read line; do
            [ -f "${line/\~/$HOME}" ] && echo "$line"
          done | fzf-tmux -d -m -q "$*" -1) && nvim ${files//\~/$HOME}
  zle redisplay
}
zle     -N   fv
bindkey '^e' fv

# fv - open files in ~/.viminfo
fw() {
  local files
  files=$(fd -d 1 . '/home/marius/Dropbox/Apps/vimwiki/' | fzf-tmux -d -m -q "$*" -1) && nvim ${files//\~/$HOME}
  #if [[ -n $files ]]
  #then
     #nvim -- $files
     #print -l $files[1]
  #fi

  zle redisplay
}
zle     -N   fv
bindkey '^w' fv
