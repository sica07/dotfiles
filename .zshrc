source ~/.local/bin/antigen.zsh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
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


antigen theme cloud
#antigen theme gnzh
#antigen theme miloshadzic
#antigen theme xiong-chiamiov-plus
antigen theme geometry-zsh/geometry
#RPROMPT='🔋 $(battery_pct_prompt)'


antigen apply

export PATH="$PATH:$HOME/.local/bin"
export PATH=/usr/sbin:$PATH
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"
export LC_ALL="en_US.utf8"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export TERMINAL="stterm"
export BROWSER="firefox"
export READER="zathura"
export EDITOR="nvim"
export FILE="ranger"
export PAGER=most man ls
export ONI_NEOVIM_PATH="/home/marius/.local/bin/nvim"
export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar
export SUDO_ASKPASS=/usr/bin/ssh-askpass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

export PYTHONPATH="$HOME/osm2city"

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
#alias cat='bat'
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
alias alias-edit='nvim ~/.zshrc'
alias r='ranger'
alias todo='nvim ~/Dropbox/Apps/vimwiki/todo.txt';
alias td='nvim ~/Dropbox/Apps/vimwiki/todo.txt';
alias space='ncdu -rr -x'
alias du='ncdu -rr -x'
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
alias portainer='sudo docker run -d -p 7800:8000 -p 7900:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer'
alias peggo='youtube-dl -x --audio-quality 0 --audio-format mp3 --embed-thumbnail --metadata-from-title "%(artist)s - %(title)s"'
alias mobi='kindlegen'
alias random='shuf -n 1 -i'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias mh="mpv --pause --video-zoom=.3 --volume=0 ~/Videos/program/H/"
alias mr="mpv --pause --video-zoom=.3 ~/Videos/program/M/"
alias mm="mr&mh"
#alias ruga="feh --auto-zoom --full-screen ~/Videos/program/rugaciune.jpg"
alias ruga="feh --bg-fill ~/Videos/program/ruga3.jpg"
alias show="feh --auto-zoom --fullscreen "
alias todo="nvim ~/Dropbox/Apps/vimwiki/todo.txt"
alias mntg="sudo mount /dev/sda5 /mnt"
alias gog="cd /mnt/home/marius/ryuuma"


# FUNCTIONS
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

compctl -K _completemarks jump
compctl -K _completemarks unmark
