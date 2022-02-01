#!/bin/sh
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""
echo "Don't forget to update the PHP, node and nvim versions"
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""

cd
#install infinality fonts ppa
#sudo add-apt-repository ppa:no1wantdthisname/ppa
#install node
sudo apt install curl software-properties-common -y
#curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
#sudo apt install nodejs -y
sudo apt install pcmanfm zsh mc htop tmux compton ripgrep python3-dev python3-pip python3-setuptools sysstat git-extras locate dict editorconfig ncal exa fzf autoconf ssh-askpass ncal feh -y &&
sudo apt-get install dunst tig html-xml-utils ncdu grc rofi i3 i3status clipit vim-nox meld zathura redshift qutebrowser pass qtpass geoclue-2.0 redshift translate-shell mpv  nmon  tint2 fd-find kitty luakit network-manager-openvpn-gnome -y

sudo flatpak install -y postman slack dbeaver
#install nodejs
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs npm

#install yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

yarn global add intelephense
#Delta-git
wget https://github.com/dandavison/delta/releases/download/0.11.3/git-delta_0.11.3_amd64.deb && sudo dpkg -i git-delta_0.11.3_amd64 && rm git-delta_0.11.3_amd64
#TLDR
wget https://gitlab.com/pepa65/tldr-bash-client/raw/master/tldr && chmod +x tldr && mv tldr ~/.local/bin/tldr
#install duf
wget https://github.com/muesli/duf/releases/download/v0.6.2/duf_0.6.2_linux_amd64.deb && sudo dpkg -i duf*
#xh - httpie alternative
curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh

#install gaps
sudo apt install meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev
sudo purge i3
git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps
mkdir -p build && cd build/
meson --prefix /usr/local
ninja
sudo ninja install
#../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make && sudo make install
#install docker
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo groupadd docker && sudo usermod -aG docker marius

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#install universal-ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh && ./configure && make && sudo make install

#PHP
#sudo apt install php7.3 php7.3-cli php7.3-common php7.3-xml php7.3-mbstring &&
#php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#php composer-setup.php --install-dir=/usr/bin --filename=composer
#composer global require phpmd/phpmd &&
#composer global require vimeo/psalm &&
#composer global require friendsofphp/php-cs-fixer


#NEOVIM
wget http://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage  &&
chmod u+x nvim.appimage && cp nvim.appimage ~/.local/bin/nvim && sudo ln -s ~/.local/bin/nvim /usr/bin/nvim

pip3 install wheel neovim pynvim
pip install wheel pynvim

#VIM configuration
git clone https://github.com/sica07/.vim.git &&
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle &&
vim +PluginInstall +qall &&
cp .vim/_vimrc .vimrc

#nvim configuration
cd ~/.config && git clone https://github.com/sica07/nvim.git && nvim +PlugInstall


#base16 colors for both VIM and shell
git clone https://github.com/chriskempson/base16-shell.git /home/marius/.config/base16-shell
#ZSH configuration
mkdir /home/marius/.local/bin &&
curl -L git.io/antigen > /home/marius/.local/bin/antigen.zsh && chmod +x /home/marius/.local/bin/antigen.zsh
ln -s  /home/marius/dotfiles/zshrc ~/.zshrc
sudo chsh -s $(which zsh)

#install ranger
sudo apt-get install ranger caca-utils w3m-img bsdtar mediainfo poppler-utils highlight \
&& ranger --copy-config=all \
&& sed -i 's/preview_images false/preview_images true/g' ~/.config/ranger/rc.conf \
&& cp ranger/rifle.conf ~/.config/ranger/rifle.conf \
&& git clone git@github.com:alexanderjeurissen/ranger_devicons.git \
&& cd ranger_devicons && make install

#install bat
wget https://github.com/sharkdp/bat/releases/download/v0.15.4.0/bat_0.15.4.0_amd64.deb && sudo dpkg -i bat*.deb

#install prettyping
curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
chmod +x prettyping && sudo cp prettyping /usr/sbin/

#install greenclip for rofi
curl -L  > https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && chmod +x /home/marius/.local/bin/antigen.zsh && chmod +x /home/marius/.local/bin/greenclip


#Other configurations
#git clone https://github.com/sica07/dotfiles.git
#mkdir ~/.config/i3blocks
mkdir ~/.config/dunst
mkdir ~/.config/tint2

cp dotfiles/kitty.conf ~/.config/kitty/kitty.conf
cp dotfiles/dunstrc ~/.config/dunst/dunstrc
#cp dotfiles/_surf ~/.surf
cp dotfiles/tint2rc ~/.config/tint2/tint2rc
#ln -s dotfiles/_xprofile ~/.xprofile
#ln -s dotfiles/sxkhd ~/.config/sxhkd
ln -s dotfiles/compton.conf compton.conf
ln -s dotfiles/.gitconfig .gitconfig
#ln -s dotfiles/.i3blocks.conf .i3blocks.conf
ln -s dotfiles/.xmodmaprc .xmodmaprc
#cp  dotfiles/i3blocks/* .config/i3blocks/*
cp  dotfiles/i3/* .config/i3/*
#ln -s dotfiles/.i3status.conf .i3status.conf
ln -s dotfiles/.commit-template.txt .commit-template.txt
rm -f .zshrc && ln -s dotfiles/.zshrc .zshrc
rm -f .tmux.conf && ln -s dotfiles/.tmux.conf .tmux.conf
tic dotfiles/tmux-256color.terminfo

#Powerline Nerd fonts
mkdir /home/marius/.fonts &&
mkdir /home/marius/.config/fontconfig &&
mkdir /home/marius/.config/fontconfig/conf.d &&
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete.ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.otf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete%20Mono.otf
wget https://github.com/abertsch/Menlo-for-Powerline/raw/master/Menlo%20for%20Powerline.ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/complete/Meslo%20LG%20L%20Regular%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.otf
mv Menlo* /home/marius/.fonts/
mv Meslo* /home/marius/.fonts/
mv Fira* /home/marius/.fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip && unzip Iosevka.zip -d /home/marius/.fonts/ && cp /home/marius/.fonts/ttf/* /home/marius/.fonts/
fc-cache -vf /home/marius/.fonts/

#Dropbox
sudo apt install libpango1.0-0
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb && sudo dpkg -i download*.deb && dropbox start -i


#TOOLS
pip install grip litecli pgcli mycli

