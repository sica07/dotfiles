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
#antigen bundle battery
# a series of aliases and functions which make a System Administrator's life easier
antigen bundle systemadmin


antigen theme cloud
#antigen theme gnzh
#antigen theme miloshadzic
#antigen theme geometry-zsh/geometry
#RPROMPT='🔋 $(battery_pct_prompt)'


antigen apply

export PATH="$PATH:$HOME/.local/bin"
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"
export LC_ALL="en_US.utf8"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export TERMINAL="kitty"
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
export DISABLE_AUTO_TITLE="true"

export LUA_PATH='/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;/usr/lib/lua/5.4/?.lua;/usr/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/marius/.luarocks/share/lua/5.4/?.lua;/home/marius/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/lib/lua/5.4/?.so;/usr/lib/lua/5.4/loadall.so;./?.so;/home/marius/.luarocks/lib/lua/5.4/?.so'
export PATH='/home/marius/.luarocks/bin:/home/marius/.yarn/bin:/home/marius/.config/yarn/global/node_modules/.bin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/lib:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/aws:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cp:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/composer:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-compose:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/fzf:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker:/home/marius/.antigen/bundles/djui/alias-tips:/home/marius/.antigen/bundles/webyneter/docker-aliases:/home/marius/.antigen/bundles/zsh-users/zsh-syntax-highlighting:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/vi-mode:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/tmux:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git-extras:/home/marius/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/systemadmin:/home/mariusm/.config/composer/vendor/bin:/home/marius/.local/bin:/home/marius/.config/composer/vendor/bin:/home/marius/.fzf/bin'

#export XDG_RUNTIME_DIR=/tmp

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
alias bc='bc -l -q'
alias h='history'
alias myip="curl ipinfo.io/ip"
alias tm='cd ~/Sync/tmuxp && tmuxp load'
alias v='nvim'
alias lynx='lx'
alias cat='bat --theme GitHub'
alias ping='prettyping --nolegend'
alias find='/usr/bin/fd'
alias mpv='mpv --video-sync=display-resample --hwdec=auto'
alias audiompv='mpv  --ytdl-format="bestaudio/best"'
alias stream='mpv  -vo=gpu --hwdec=vaapi'
alias keymap='setxkbmap -layout'
#alias st='stterm -f "Iosevka Term:size=18"'

# privileged access
if [ $UID -ne 0 ]; then
    alias svim='sudo nvim'
    alias reboot='sudo reboot'
    alias shutdown='sudo shutdown -h now'
    alias off='sudo shutdown -h now'
    alias upgrade='sudo pacman -Syu'
    alias update=''
    alias purge='yay -Rns '
    alias uninstall='yay -Rs '
    alias install='yay -S '
    #Alias to remove orphaned packages
    alias orphan='sudo pacman -Rsn $(pacman -Qqdt)'
    alias root='sudo su'
    alias _='sudo'
fi

#OTHERS
alias mysql='mysql --auto-rehash --auto-vertical-output'
alias meteo='curl wttr.in/Ghimbav'
alias cutremur='curl https://secure.geonames.org/earthquakesJSON\?north\=48.26\&south\=43.62\&east\=29.71\&west\=20.26\&date\='2020-06-04'\&username=sica07 | jq ".earthquakes[0]"'
alias alias-edit='nvim ~/.zshrc'
alias r='ranger'
alias todo='nvim -o ~/Documents/vimwiki/{todo.txt,doing.txt,done.txt}';
alias n='nvim ~/Documents/vimwiki/Scratch.md';
alias today='bat --theme TwoDark -p --language swift -r 1:10 ~/Documents/vimwiki/todo.txt';
alias t='nvim -o ~/Documents/vimwiki/{todo.txt,doing.txt,done.txt}';
alias space='duf --sort size'
alias du='duf --sort size'
alias help='tldr'
alias wallpaper="feh --recursive --randomize --bg-fill '/home/marius/Sync/Desktoppr/' &"
alias moon="feh --bg-fill '/home/marius/Sync/Desktoppr/moon50k.png'"
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
alias phpsh='psysh'
alias dropboxu="rclone sync ~/Sync/vimwiki dropbox:Apps/vimwiki"
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
alias todo="nvim ~/Sync/vimwiki/todo.txt"
alias ls="exa --icons"
alias la="exa --icons -la"
alias ll="exa --icons -l"

alias '?'="duck"

alias rescue="env -u SESSION_MANAGER rescuetime &"
alias kanban="cd ~/Sync/vimwiki && nvim -O {todo,doing,done}.txt"

alias abi='ssh -t abi "tmux a -t 0"'



# FUNCTIONS
function kil {
    kill -SIGTERM $(pidof $1)
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


# Search on duckduckgo
function duck() {
    lx "https://lite.duckduckgo.com/lite?kd=-1&kp=-1&q=$*"
}

function g() {
    lx "https://lite.duckduckgo.com/lite?kd=-1&kp=-1&q=!g $*"
}

function so() {
    lx "https://lite.duckduckgo.com/lite?kd=-1&kp=-1&q=!so $*"
}

function w() {
    lx "https://lite.duckduckgo.com/lite?kd=-1&kp=-1&q=!w $*"
}

function k() {
    lx "https://lite.duckduckgo.com/lite?kd=-1&kp=-1&q=!php $*"
}

# Docker
function dssh() {
   docker exec -it "$@" bash
}

# Create a new directory and enter it
function mkd() {
   mkdir -p "$@" && cd "$@"
}
# Make a pdf look like scanned
function xerox() {
  convert -density 150 "$@" -colorspace gray -blur 0x0.1 -sharpen 0x5.0 -level 10%,90% -rotate -0.5 -sharpen 0x1.2 xerox.pdf
}
function pdftojpg() {
    convert -density 600 "$@" planificare.jpg
}
# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-9000}"
	sleep 2 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

function lx() {
lynxpath=/usr/bin/lynx
[[ ! -x $lynxpath ]] && lynxpath=/usr/local/bin/lynx

useragent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1 Lynx"

if [ -e "$HOME/.config/lynx/lynx.cfg" ];then
  export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
fi

if [ -e "$HOME/.config/lynx/lynx.lss" ];then
  export LYNX_LSS="$HOME/.config/lynx/lynx.lss"
fi

if [ ! -x "$lynxpath" ]; then
  echo "Doesn't look like lynx is installed."
  exit 1
fi

exec "$lynxpath" --useragent="$useragent" -accept_all_cookies "$@"
}

function txt()
{
    exec pandoc -t plain  "$@" | bat -p
}

function book()
{
    exec pandoc -t markdown  "$@" | nvim -c "set ft=markdown"
}

function reader() {
    pandocpath=/usr/bin/pandoc
    [[ ! -x $pandocpath ]] && pandocpath=/usr/local/bin/pandoc

    exec "$pandocpath" -f html -t plain  "$@"  | bat -p --theme='TwoDark'
}

## Use keep.sh to transfer files
transfer() { if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

copy(){
    cat | xclip -selection clipboard
}

paste(){
    xclip -selection clipboard -o
}

zet(){
    nvim "+Zet $*"
}


f() {
    local file
    file=$(rg "$*" --color never -n . | fzf) && nvim -c $(echo "/$*") +$(echo $file | /usr/bin/cut -d':' -f2) $(echo $file | /usr/bin/cut -d':' -f1)
}

spell() {
  wget -q -U Mozilla -O - https://translate.google.com.vn/translate_tts\?ie\=UTF-8\&q\=$*\&tl\=en\&client\=tw-ob | mpg123 -
}

timer() {
runtime="$@ minute"
endtime=$(date -ud "$runtime" +%s)

echo "Starting the $@ minutes timer..."
notify-send -a "Timer" "Starting the $@ minutes timer..."
while [[ $(date -u +%s) -le $endtime ]]
do
    sleep 1m
done

echo "The $@ minutes time is up!"
notify-send -a "Timer" "The $@ minutes time is up!"
mpv /usr/share/sounds/Fresh_and_Clean/stereo/system-ready.ogg
}

setoen()
{
from=se
to=en  # de, fr, es, etc.
browser=xdg-open

text=$(xclip c -o | sed 's/\//\\\//g' | sed 's/|/\\|/g' | sed ':loop; N; $!b loop; s/\n//g' | nkf -WwMQ | sed 's/=$//g' | tr = % | tr -d '\n')
$browser "https://www.deepl.com/translator#${from}/${to}/${text}"
}
entoro()
{
from=en
to=ro  # de, fr, es, etc.
browser=xdg-open

text=$(xclip c -o | sed 's/\//\\\//g' | sed 's/|/\\|/g' | sed ':loop; N; $!b loop; s/\n//g' | nkf -WwMQ | sed 's/=$//g' | tr = % | tr -d '\n')
$browser "https://www.deepl.com/translator#${from}/${to}/${text}"
}

rotoen()
{
from=ro
to=en  # de, fr, es, etc.
browser=xdg-open

text=$(xclip c -o | sed 's/\//\\\//g' | sed 's/|/\\|/g' | sed ':loop; N; $!b loop; s/\n//g' | nkf -WwMQ | sed 's/=$//g' | tr = % | tr -d '\n')
$browser "https://www.deepl.com/translator#${from}/${to}/${text}"
}
compctl -K _completemarks jump
compctl -K _completemarks unmark
