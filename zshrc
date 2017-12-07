#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/dotfiles/my-fzf.zsh ] && source ~/dotfiles/my-fzf.zsh
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
alias tm='cd ~/tmuxp && tmuxp load'
alias v='vim'

#DOCKER
alias dclc='docker rm $(docker ps -a -q)'
alias dcli='docker rmi $(docker images -q)'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dins='docker inspect'
alias dlog='docker logs'
alias dexe='docker exec -it'
alias drun='docker run --name'
alias dcup='docker compose up --build'
alias dcst='docker compose stop'


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
alias alias-edit='vim ~/.zprezto/runcoms/zshrc'
alias r='ranger'
alias fm='vifm'
alias space='ncdu'
alias hotnews='w3m -num http://www.hotnews.ro/Ultima_ora'
alias hnews='w3m -num https://news.ycombinator.com/'
alias bbc='w3m -num http://www.bbc.com/news/world'
alias jw='w3m -num https://jw.org/en/whats-new'
alias wol='w3m -num https://wol.jw.org/ro'
alias wallpaper="feh --recursive --randomize --bg-fill '/home/marius/Dropbox/Apps/Desktoppr/' &"
alias pig='ping google.ro'
alias fboff="sudo -- sh -c -e 'echo '127.0.0.1' facebook.com >> /etc/hosts'"
alias fbon="sudo -- sh -c -e 'sed --in-place '/facebook/d' /etc/hosts'"
alias phpqa="phpqa --report --tools phpmetrics,phploc,phpmd,pdepend,phpcpd,parallel-lint --analyzedDirs"
alias imginfo="identify  -format 'Name: %f Dimensions: %P Type: %m'"
#SSH
alias marius='ssh -X marius@192.168.1.120'
alias neuron='ssh -p2222 rovis999@neuronsolutions.ro'
alias ayop='ssh -i ~/.ssh/air-ec2.pem ubuntu@ec2-52-8-184-200.us-west-1.compute.amazonaws.com'
alias ayod='ssh -i ~/.ssh/ayo-prod-api.pem ubuntu@ec2-54-183-203-118.us-west-1.compute.amazonaws.com'
alias airdb='mysql -hayo-db.cs9no2s1zd0i.us-west-1.rds.amazonaws.com -uayo_admin -pWeak-Uuuu-nose-Slop'
alias airdd='mysql -hair-dev-db.cs9no2s1zd0i.us-west-1.rds.amazonaws.com -uayo_admin -pWeak-Uuuu-nose-Slop'

alias openSockets='lsof -i' # netCons:      Show all open TCP/IP sockets
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list' # showBlocked:  All ipfw rules inc/ blocked IPs

#PROCESS MANAGEMENT
alias memTop='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpuTop='ps wwaxr -o pid,stat,%cpu,time,command | head -10'


#BASE16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#Temporary 
alias myrouter='ssh root@192.168.1.22 -p1981'
alias td='python3 ~/Templates/lpy/td.py'
alias tgl='python ~/Templates/toggle/tgl.py'
alias zp='source ~/.zshrc'
alias lake="feh --bg-fill '/home/marius/Dropbox/Apps/Desktoppr/lake-2016-06-21-1549.jpg'"
