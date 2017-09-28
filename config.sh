#!/bin/sh
cd 
#install infinality fonts ppa
sudo add-apt-repository ppa:no1wantdthisname/ppa

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install npm rxvt-unicode-256color zsh mc htop tmux compton -y &&
sudo apt-get install fontconfig-infinality dunst html-xml-utils-y
sudo npm install -g diff-so-fancy

#set infinality fonts to Linux
sudo bash /etc/fonts/infinality/infctl.sh setstyle
sudo sed -i 's/USE_STYLE="DEFAULT"/USE_STYLE="LINUX"/g' /etc/profile.d/infinality-settings.sh

#VIM configuration
git clone https://github.com/sica07/.vim.git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
cp .vim/_vimrc .vimrc

#ZSH configuration
#git clone https://github.com/sica07/.oh-my-zsh.git
git clone --recursive https://github.com/sica07/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" &&
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
&& chsh -s /bin/zsh

#base16 colors for both VIM and shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
echo 'BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"' >> .zshrc

#install ranger
sudo apt-get install ranger caca-utils w3m-image bsdtar mediainfo poppler-utils highlight
&& ranger --copy-config=all
&& sed -i 's/preview_images false/preview_images true/g' ~/.config/ranger/rc.conf



#Other configurations
#git clone https://github.com/sica07/dotfiles.git
rm -f .Xresources && ln -s dotfiles/.Xdefaults .Xresources
mkdir ~/.config/dunst
ln -s dotfiles/dunstrc ~/.config/dunst/dunstrc
ln -s dotfiles/compton.conf compton.conf
ln -s dotfiles/.gitconfig .gitconfig
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
mv Fira* ~/.fonts/
fc-cache -vf ~/.fonts/

#FLUX
sudo apt-get install git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1
cd /tmp
git clone "https://github.com/xflux-gui/xflux-gui.git"
cd xflux-gui
python download-xflux.py
sudo python setup.py install

