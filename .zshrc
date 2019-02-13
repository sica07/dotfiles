source ~/.local/bin/antigen.zsh

antigen use oh-my-zsh

#support for awscli and a few utilities to manage AWS profiles
antigen bundle aws
#This plugin defines a cpv function that uses rsync so that you get the features and security of this command.
antigen bundle cp
alias cp='cpv'
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
#antigen theme xiong-chiamiov-plus
#antigen theme geometry-zsh/geometry
#RPROMPT='🔋 $(battery_pct_prompt)'


antigen apply

export PATH="$PATH:$HOME/.local/bin"
export PATH=/usr/sbin:$PATH
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export TERMINAL="xfce4-terminal"
export BROWSER="firefox"
export READER="zathura"
export EDITOR="nvim"
export FILE="ranger"

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
alias v='vim'
alias cat='bat'
alias ping='prettyping --nolegend'
alias find='/usr/bin/fd'

# privileged access
if [ $UID -ne 0 ]; then
    alias svim='sudo vim'
    alias reboot='sudo reboot'
    alias shutdown='sudo shutdown -h now'
    alias off='sudo shutdown -h now'
    alias update='sudo apt-get update'
    alias upgrade='sudo apt-get upgrade'
    alias purge='sudo apt-get purge'
    alias install='sudo apt-get install'
    alias root='sudo su'
    alias _='sudo'
fi

#OTHERS
alias mysql='mysql --auto-rehash --auto-vertical-output'
alias meteo='curl wttr.in/Brasov'
alias alias-edit='vim ~/.zsh/aliases.zsh'
alias r='ranger'
alias space='ncdu --color dark -rr -x'
alias du='ncdu --color dark -rr -x'
alias help='tldr'
alias wallpaper="feh --recursive --randomize --bg-fill '/home/marius/Dropbox/Apps/Desktoppr/' &"
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
url="https://wol.jw.org/ro/wol/dt/r34/lp-m/"
today=$(date "+%Y/%m/%d")
alias dt='w3m $url$today'
