fish_vi_key_bindings

######################
### Custom abbres ###
######################
abbr .. 'cd ..'         # Go up one directory
abbr ... 'cd ../..'     # Go up two directories
abbr .... 'cd ../../..' # Go up three directories
abbr - 'cd -'           # Go back
abbr k 'clear'
abbr bc 'bc -l'
abbr h 'history'
abbr myip "curl ipinfo.io/ip"
abbr tm 'cd ~/Dropbox/Apps/tmuxp && tmuxp load'
abbr v 'nvim'
abbr cat 'bat --theme GitHub'
abbr ping 'prettyping --nolegend'
abbr find '/usr/bin/fd'
#abbr st 'stterm -f "Iosevka Term:size 18"'

# privileged access
abbr svim 'sudo nvim'
abbr reboot 'sudo reboot'
abbr shutdown 'sudo shutdown -h now'
abbr off 'sudo shutdown -h now'
abbr update 'sudo apt update'
abbr upgrade 'sudo apt upgrade'
abbr purge 'sudo apt purge'
abbr install 'sudo apt install'
abbr root 'sudo su'
abbr _ 'sudo'

#OTHERS
abbr mysql 'mysql --auto-rehash --auto-vertical-output'
abbr meteo 'curl wttr.in/Ghimbav'
abbr cutremur 'curl https://secure.geonames.org/earthquakesJSON\?north\=48.26\&south\=43.62\&east\=29.71\&west\=20.26\&date\='2020-06-04'\&username=sica07 | jq ".earthquakes[0]"'
abbr abbr-edit 'nvim ~/.config/fish/config.fish'
abbr r 'ranger'
abbr todo 'nvim ~/Dropbox/Apps/vimwiki/todo.txt';
abbr n 'nvim ~/Dropbox/Apps/vimwiki/Scratch.md';
abbr today 'bat --theme GitHub --language swift -r 1:10 ~/Dropbox/Apps/vimwiki/todo.txt';
abbr td 'nvim ~/Dropbox/Apps/vimwiki/todo.txt';
abbr space 'ncdu -rr -x'
abbr du 'ncdu -rr -x'
abbr help 'tldr'
abbr wallpaper "feh --recursive --randomize --bg-fill '/home/marius/Dropbox/Apps/Desktoppr/' &"
abbr moon "feh --bg-fill '/home/marius/Dropbox/Apps/Desktoppr/moon50k.png'"
abbr pig 'ping google.ro'
abbr fboff "sudo -- sh -c -e 'echo '127.0.0.1' facebook.com >> /etc/hosts'"
abbr fbon "sudo -- sh -c -e 'sed --in-place '/facebook/d' /etc/hosts'"
abbr imginfo "identify  -format 'Name: %f Dimensions: %P Type: %m'"
abbr rg 'rg --color always'
abbr rgi 'rg --no-ignore'
abbr rgc 'rg -C 5'
abbr rgci 'rg -C 5 --no-ignore'
abbr rss 'newsboat'
abbr podcast 'podboat'
abbr memTop 'ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
abbr cpuTop 'ps wwaxr -o pid,stat,%cpu,time,command | head -10'
abbr tetris 'bastet'
abbr snake 'nsnake'
abbr tron 'ssh sshtron.zachlatta.com'
abbr ww 'nvim -c VimwikiIndex'
abbr portainer 'sudo docker run -d -p 7800:8000 -p 7900:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer'
abbr peggo 'youtube-dl -x --audio-quality 0 --audio-format mp3 --embed-thumbnail --metadata-from-title "%(artist)s - %(title)s"'
abbr mobi 'kindlegen'
abbr random 'shuf -n 1 -i'
abbr phpr 'psysh'

abbr g 'git'
abbr gco 'git checkout'
abbr gcom 'git checkout master'
abbr gst 'git status'
abbr gl 'git pull'
abbr glm 'git pull origin master'
abbr gp 'git push'
abbr gpm 'git push origin master'
abbr gbc 'git checkout -b'
abbr gu 'git reset HEAD~'
abbr grbi 'git rebase -i'
# clean up untracked files
abbr gcl 'git clean -f -d'


abbr d 'docker'
abbr deit 'docker exec -it'
abbr dins 'docker inspect'
abbr dc 'docker-compose'
abbr dcup 'docker-compose up'
abbr dcupb 'docker-compose up --build'
abbr dcps 'docker-compose ps'
abbr dcimg 'docker-compose images'
abbr dcrm 'docker-compose rm'

# Create a new directory and enter it
function mkd
  command mkdir -p $argv && cd $argv
end

function gg
    command w3m 'https://duckduckgo.com/?q='$argv
end

function kil
    set id=pidof $argv
    command kill -SIGTERM $id
end
