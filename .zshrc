source ~/.local/bin/antigen.zsh
#if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#        source /etc/profile.d/vte.sh
#fi
antigen use oh-my-zsh

#support for awscli and a few utilities to manage AWS profiles
antigen bundle aws
#This plugin defines a cpv function that uses rsync so that you get the features and security of this command.
antigen bundle cp
#alias cp='cpv'
#completion for composer, as well as aliases
antigen bundle composer
# provides completion for docker-compose as well as some aliases
antigen bundle docker-compose
antigen bundle fzf
antigen bundle npm
antigen bundle docker
antigen bundle djui/alias-tips
antigen bundle webyneter/docker-aliases.git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle vi-mode
antigen bundle tmux
antigen bundle git
antigen bundle git-extras
antigen bundle battery
# a series of aliases and functions which make a System Administrator's life easier
antigen bundle systemadmin


#antigen theme cloud
antigen theme gnzh
#antigen theme miloshadzic
#antigen theme geometry-zsh/geometry
#RPROMPT='🔋 $(battery_pct_prompt)'


antigen apply

export PATH="$PATH:$HOME/.local/bin"
export PATH=/usr/sbin:$PATH
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"
export LC_ALL="en_US.utf8"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export TERMINAL="stterm"
export BROWSER="surf"
export READER="zathura"
export EDITOR="nvim"
export FILE="ranger"
export PAGER=most man ls
export BAT_PAGER=less
export ONI_NEOVIM_PATH="/home/marius/.local/bin/nvim"
export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar
export SUDO_ASKPASS=/usr/bin/ssh-askpass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export GIT_SSH_VARIANT=ssh
export NVIM_COC_LOG_FILE=coc.log
export XDG_RUNTIME_DIR=/tmp/psalmls

#export PYTHONPATH="$HOME/osm2city"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/dotfiles/my-fzf.zsh ] && source ~/dotfiles/my-fzf.zsh

### color output for many commands
if [[ "$TERM" != dumb ]] && (( $+commands[grc] )) ; then

    # Supported commands
    cmds=(
    cc \
        configure \
        cvs \
        df \
        diff \
        dig \
        gcc \
        gmake \
        ifconfig \
        last \
        ldap \
        ls \
        make \
        mount \
        mtr \
        netstat \
        ping \
        ping6 \
        ps \
        traceroute \
        traceroute6 \
        wdiff \
        whois \
        iwconfig \
        );

    # Set alias for available commands.
    for cmd in $cmds ; do
        if (( $+commands[$cmd] )) ; then
            alias $cmd="grc --colour=auto $(whence $cmd)"
        fi
    done
    # Clean up variables
    unset cmds cmd
fi

######################
### Custom Aliases ###
######################
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back
alias k='clear'
alias bc='bc -l'
alias h='history'
alias myip="curl ipinfo.io/ip"
alias tm='cd ~/Dropbox/Apps/tmuxp && tmuxp load'
alias v='nvim'
alias cat='bat --theme GitHub'
alias ping='prettyping --nolegend'
alias find='/usr/bin/fd'
#alias st='stterm -f "Iosevka Term:size=18"'

# privileged access
if [ $UID -ne 0 ]; then
    alias svim='sudo nvim'
    alias reboot='sudo reboot'
    alias shutdown='sudo shutdown -h now'
    alias off='sudo shutdown -h now'
    alias update='sudo apt update'
    alias upgrade='sudo apt upgrade'
    alias purge='sudo apt purge'
    alias install='sudo apt install'
    alias root='sudo su'
    alias _='sudo'
fi

#OTHERS
alias mysql='mysql --auto-rehash --auto-vertical-output'
alias meteo='curl wttr.in/Ghimbav'
alias cutremur='curl https://secure.geonames.org/earthquakesJSON\?north\=48.26\&south\=43.62\&east\=29.71\&west\=20.26\&date\='2020-06-04'\&username=sica07 | jq ".earthquakes[0]"'
alias alias-edit='nvim ~/.zshrc'
alias r='ranger'
alias todo='nvim -o ~/Dropbox/Apps/vimwiki/{todo.txt,doing.txt,done.txt}';
alias n='nvim ~/Dropbox/Apps/vimwiki/Scratch.md';
alias today='bat --theme GitHub --language swift -r 1:10 ~/Dropbox/Apps/vimwiki/todo.txt';
alias t='nvim -o ~/Dropbox/Apps/vimwiki/{todo.txt,doing.txt,done.txt}';
alias space='duf --sort size'
alias du='duf --sort size'
alias help='tldr'
alias wallpaper="feh --recursive --randomize --bg-fill '/home/marius/Dropbox/Apps/Desktoppr/' &"
alias moon="feh --bg-fill '/home/marius/Dropbox/Apps/Desktoppr/moon50k.png'"
alias pig='ping google.ro'
alias fboff="sudo -- sh -c -e 'echo '127.0.0.1' facebook.com >> /etc/hosts'"
alias fbon="sudo -- sh -c -e 'sed --in-place '/facebook/d' /etc/hosts'"
alias imginfo="identify  -format 'Name: %f Dimensions: %P Type: %m'"
alias rg='rg --color always'
alias rgi='rg --no-ignore'
alias rgc='rg -C 5'
alias rgci='rg -C 5 --no-ignore'
alias memTop='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpuTop='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias tetris='bastet'
alias snake='nsnake'
alias tron='ssh sshtron.zachlatta.com'
alias ww='nvim -c VimwikiIndex'
url="https://wol.jw.org/ro/wol/dt/r34/lp-m/"
today=$(date "+%Y/%m/%d")
alias dt='w3m $url$today'
alias portainer='sudo docker run -d -p 7800:8000 -p 7900:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce'
alias peggo='youtube-dl -x --audio-quality 0 --audio-format mp3 --embed-thumbnail --metadata-from-title "%(artist)s - %(title)s"'
alias mobi='kindlegen'
alias random='shuf -n 1 -i'
alias phpr='psysh'
alias dropboxu="rclone sync ~/Dropbox/Apps/vimwiki dropbox:Apps/vimwiki"
#NF will always point to the newest file/directory in that current folder
#e.g. tar xf NF //untar the newest file
alias -g NF='./*(oc[1])'
alias -s git='git clone'
alias -s {jpg,jpeg,png}='feh -x -. -d --draw-exif --draw-tinted -B "black"'
alias -s pdf='zathura'
alias -s {mp4,mp3,flac,ogg,wav}='mpv'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias mh="mpv --pause --video-zoom=.3 --volume=0 ~/Videos/program/H/"
alias mr="mpv --pause --video-zoom=.3 ~/Videos/program/M/"
alias mm="mr&mh"
alias ruga="feh --bg-fill ~/Videos/program/ruga3.jpg"
alias show="feh --auto-zoom --fullscreen "
alias todo="nvim ~/Dropbox/Apps/vimwiki/todo.txt"
alias ls="exa --icons"

alias mntg="sudo mount /dev/sda5 /mnt"
alias gog="cd /mnt/home/marius/ryuuma"
alias rescue="env -u SESSION_MANAGER rescuetime &"
alias vpn="cd ~/Documents && sudo openvpn lynx.ovpn"
alias cvpn="cd ~/Documents && sudo openvpn carnext.vpn"
alias kanban="cd ~/Dropbox/Apps/vimwiki && nvim -O {todo,doing,done}.txt"



# FUNCTIONS
function kil {
    kill -SIGTERM $(pidof $1)
}
function d {
    w3m 'https://duckduckgo.com/?q='$1
}
## JUMP functionality
export MARKPATH=$HOME/.marks
function j {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
	rm -i "$MARKPATH/$1"
}
function marks {
	ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
function _completemarks {
  reply=($(ls $MARKPATH))
}

## clockify scripts

function clk {
    curl --data "{\"start\": \"$(date -u +"%Y-%m-%dT%TZ")\", \"description\":\"$1\"}" -H "content-type: application/json" -H "X-Api-Key: X8fZTAMwBgJQNJGU" -X POST https://api.clockify.me/api/v1/workspaces/5ec9089187cbcc1ab7f15b3b/time-entries | jq
}

function clks {
    curl --data "{\"end\": \"$(date -u +"%Y-%m-%dT%TZ")\"}" -H "content-type: application/json" -H "X-Api-Key: X8fZTAMwBgJQNJGU" -X PATCH https://api.clockify.me/api/v1/workspaces/5ec9089187cbcc1ab7f15b3b/user/5ec9089187cbcc1ab7f15b3a/time-entries | jq
}

function report {
    curl --data "start=$(date -u +"%Y-%m-%dT00:00:00Z")&hydrated=true" --get -H "content-type: application/json" -H "X-Api-Key: X8fZTAMwBgJQNJGU" -X GET https://api.clockify.me/api/v1/workspaces/5ec9089187cbcc1ab7f15b3b/user/5ec9089187cbcc1ab7f15b3a/time-entries | jq '.[] | {project: .project.name, title: .description, duration: .timeInterval.duration} '
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
	local port="${1:-4000}"
	local ip=$(ipconfig getifaddr en0)
	sleep 2 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}"
}


# Docker
function dssh() {
   docker exec -it "$@" bash
}

# Create a new directory and enter it
function mkd() {
   mkdir -p "$@" && cd "$@"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-9000}"
	sleep 2 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

## Use keep.sh to transfer files
transfer() { if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

compctl -K _completemarks jump
compctl -K _completemarks unmark

function gg() {
        w3m 'https://duckduckgo.com/?q='$@
}
