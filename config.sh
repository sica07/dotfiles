#!/bin/sh
cd
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo Ubntu + KDE configuration specific
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

sudo apt-get update && sudo apt-get upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common zsh locate ripgrep fzf &&
sudo apt-get install korganizer kmail yakuake jq htop tmux compton python python3 python3-dev python-pip python3-pip python3-setuptools sysstat git-extras -y &&
sudo apt-get install tig html-xml-utils ncdu python3-neovim meld zathura surf mpv

#install nodejs
echo """"""""""""""""""""""""""""""""""""""""""""
echo INSTALLING NODEJS...
echo """"""""""""""""""""""""""""""""""""""""""""
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
#install yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

sudo yarn add -g diff-so-fancy tldr how-2

#install docker
echo """"""""""""""""""""""""""""""""""""""""""""
echo INSTALLING DOCKER...
echo """"""""""""""""""""""""""""""""""""""""""""
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" &&
sudo apt update
apt install docker-ce

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

#nvim configuration
cd /home/marius/.config && git clone https://github.com/sica07/nvim.git && nvim +PlugInstall

#base16 colors for both VIM and shell
git clone https://github.com/chriskempson/base16-shell.git /home/marius/.config/base16-shell

#ZSH configuration
mkdir /home/marius/bin &&
curl -L git.io/antigen > /home/marius/.local/bin/antigen.zsh && chmod +x /home/marius/.local/bin/antigen.zsh
ln -s  /home/marius/dotfiles/zshrc ~/.zshrc
chsh -s $(which zsh)

#install ranger
sudo apt-get install ranger caca-utils w3m-img libarchive-tools mediainfo poppler-utils highlight \
&& ranger --copy-config=all \
&& sed -i 's/preview_images false/preview_images true/g' /home/marius/.config/ranger/rc.conf \
&& cp ranger/rifle.conf /home/marius/.config/ranger/rifle.conf \
&& git clone git@github.com:alexanderjeurissen/ranger_devicons.git \
&& cd ranger_devicons && make install

#install bat
wget https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb && sudo dpkg -i bat*.deb

#install prettyping
curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
chmod +x prettyping && sudo cp prettyping /usr/sbin/


#Other configurations
cp dotfiles/_surf /home/marius/.surf
ln -s dotfiles/.gitconfig .gitconfig
ln -s dotfiles/.commit-template.txt .commit-template.txt
rm -f .zshrc && ln -s dotfiles/.zshrc .zshrc
rm -f .tmux.conf && ln -s dotfiles/.tmux.conf .tmux.conf

#Powerline Nerd fonts
mkdir /home/marius/.fonts/
mkdir /home/marius/.config/ && mkdir /home/marius/.config/fontconfig/
mkdir /home/marius/.config/fontconfig/conf.d/
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.otf
wget https://github.com/abertsch/Menlo-for-Powerline/raw/master/Menlo%20for%20Powerline.ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/complete/Meslo%20LG%20L%20Regular%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.otf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete.otf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.otf
mv Menlo* home/marius/.fonts/
mv Meslo* home/marius/.fonts/
mv Fura* home/marius/.fonts/
wget  https://github.com/be5invis/Iosevka/releases/download/v2.0.0/02-iosevka-term-2.0.0.zip && unzip 02-iosevka-term-2.0.0.zip -d home/marius/.fonts/ && cp home/marius/.fonts/ttf/* home/marius/.fonts/
fc-cache -vf home/marius/.fonts/

#TOOLS
pip3 install --upgrade grip tmuxp litecli pgcli mycli glances youtube_dl

#Dropbox
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb && sudo dpkg -i download*.deb && dropbox start -i

sudo apt autoremove
