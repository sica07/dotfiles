#!/bin/sh
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""
echo "Don't forget to update the PHP, node and nvim versions"
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""

cd
#install infinality fonts ppa
#sudo add-apt-repository ppa:no1wantdthisname/ppa
#install node
sudo apt-get install curl software-properties-common -y
#curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs -y
sudo apt-get install  pcmanfm npm stterm zsh mc htop tmux compton python-dev python3-dev python-pip python3-pip python-setuptools python3-setuptools sysstat git-extras recoll xclip zram-tools -y &&
sudo apt-get install dunst tig html-xml-utils ncdu grc rofi i3 i3status clipit vim-nox meld googler zathura surf redshift qutebrowser pass qtpass geoclue-2.0 redshift translate-shell -y
sudo npm install -g diff-so-fancy tldr how-2
#install yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

#install gaps
sudo apt-get install gcc make dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0-dev
git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps
autoreconf --force --install
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make && sudo make install

#install st terminal
sudo rm /usr/bin/stterm
#git clone https://git.suckless.org/st
#cd st
#wget https://st.suckless.org/patches/vertcenter/st-vertcenter-20180320-6ac8c8a.diff
#git apply st-vertcenter-20180320-6ac8c8a.diff
#wget https://st.suckless.org/patches/alpha/st-alpha-0.8.2.dif://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff
#git apply st-alpha-0.8.2.diff
#echo "don't forget to apply colorscheme from: cp ~/dotfiles/config.def.h st/"
cp -r ~/dotfiles/st ~/st
cd ~/st
make && sudo make clean install
cd

#install rclone
curl https://rclone.org/install.sh | sudo bash

#install universal-ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh && ./configure && make && sudo make install

#PHP
sudo apt install php7.3 php7.3-cli php7.3-common php7.3-xml php7.3-mbstring &&
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/bin --filename=composer
composer global require phpmd/phpmd &&
composer global require vimeo/psalm &&
composer global require friendsofphp/php-cs-fixer


#NEOVIM
wget http://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage  &&
chmod u+x nvim.appimage && cp nvim.appimage ~/.local/bin/nvim

pip3 install wheel neovim pynvim
pip install wheel pynvim

#VIM configuration
git clone https://github.com/sica07/.vim.git &&
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle &&
vim +PluginInstall +qall &&
cp .vim/_vimrc .vimrc

#nvim configuration
cd ~/.config && clone https://github.com/sica07/nvim.git
nvim +PlugInstall

# qutebrowser
cp qutebrowser ~/.local/bin/qutebrowser



#ZSH configuration
curl -L git.io/antigen > ~/.local/bin/antigen.zsh && chmod +x ~/.local/bin/antigen.zsh
ln -s  ~/dotfiles/zshrc ~/.zshrc
chsh -s $(which zsh)
#git clone https://github.com/sica07/.oh-my-zsh.git
#git clone --recursive https://github.com/sica07/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" &&
#sudo chsh -s /bin/zsh &&
#cp ~/dotfiles/zshrc ~/.zprezto/runcoms/zshrc &&
#cp ~/dotfiles/zpreztorc ~/.zprezto/runcoms/zpreztorc &&
#cp ~/dotfiles/prompt* ~/.zprezto/modules/prompt/functions/

#echo ' ========================='
#echo 'this should be run in zsh:;'
#echo '=========================='
#echo 'setopt EXTENDED_GLOB'
#echo 'for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do'
#echo '  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"'
#echo 'done'
#echo '============END==========='

#base16 colors for both VIM and shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
#echo 'BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"' >> .zshrc

#install ranger
sudo apt-get install ranger caca-utils w3m-img bsdtar mediainfo poppler-utils highlight \
&& ranger --copy-config=all \
&& sed -i 's/preview_images false/preview_images true/g' ~/.config/ranger/rc.conf \
&& cp ranger/rifle.conf ~/.config/ranger/rifle.conf \
&& git clone git@github.com:alexanderjeurissen/ranger_devicons.git \
&& cd ranger_devicons && make install

#install fzf and ripgrip
cd ~ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
cd ~ && curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb && sudo dpkg -i ripgrep_0.10.0_amd64.deb

#install bat
wget https://github.com/sharkdp/bat/releases/download/v0.6.0/bat_0.6.0_amd64.deb && sudo dpkg -i bat*.deb

#install prettyping
curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
chmod +x prettyping && sudo cp prettyping /usr/sbin/

#install fd (find on steroids)
wget https://github.com/sharkdp/fd/releases/download/v7.1.0/fd_7.1.0_amd64.deb && sudo dpkg -i fd_*.deb


#Other configurations
#git clone https://github.com/sica07/dotfiles.git
rm -f .Xresources && ln -s dotfiles/.Xdefaults .Xresources
mkdir ~/.config/i3blocks
mkdir ~/.config/dunst
cp dotfiles/dunstrc ~/.config/dunst/dunstrc
cp dotfiles/_surf ~/.surf
ln -s dotfiles/compton.conf compton.conf
ln -s dotfiles/.gitconfig .gitconfig
ln -s dotfiles/.i3blocks.conf .i3blocks.conf
ln -s dotfiles/.xmodmaprc .xmodmaprc
cp  dotfiles/i3blocks/* .config/i3blocks/*
cp  dotfiles/i3/* .config/i3/*
ln -s dotfiles/.i3status.conf .i3status.conf
ln -s dotfiles/.commit-template.txt .commit-template.txt
rm -f .zshrc && ln -s dotfiles/.zshrc .zshrc
rm -f .tmux.conf && ln -s dotfiles/.tmux.conf .tmux.conf

#Powerline Nerd fonts
mkdir ~/.fonts/
mkdir ~/.config/ && mkdir ~/.config/fontconfig/
mkdir ~/.config/fontconfig/conf.d/
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.otf
wget https://github.com/abertsch/Menlo-for-Powerline/raw/master/Menlo%20for%20Powerline.ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/complete/Meslo%20LG%20L%20Regular%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.otf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete.otf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.otf
mv Menlo* ~/.fonts/
mv Meslo* ~/.fonts/
mv Fura* ~/.fonts/
wget  https://github.com/be5invis/Iosevka/releases/download/v2.0.0/02-iosevka-term-2.0.0.zip && unzip 02-iosevka-term-2.0.0.zip -d ~/.fonts/ && cp ~/.fonts/ttf/* ~/.fonts/
fc-cache -vf ~/.fonts/

#i3lock-fancy
cd && git clone https://github.com/meskarune/i3lock-fancy.githttps://github.com/meskarune/i3lock-fancy.githttps://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy/
sudo cp lock /usr/local/bin
sudo cp -R icons /usr/local/bin

#Dropbox


#TOOLS
pip install grip tmuxp litecli pgcli mycli glances haxor-news

wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb && sudo dpkg -i download*.deb && dropbox start -i
