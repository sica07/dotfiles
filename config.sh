#!/bin/sh
cd 
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install rxvt-unicode-256color zsh mc htop tmux -y

#VIM configuration
git clone https://github.com/sica07/.vim.git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
cp .vim/_vimrc .vimrc

#ZSH configuration
git clone https://github.com/sica07/.oh-my-zsh.git
chsh -s /bin/zsh

#Other configurations
#git clone https://github.com/sica07/dotfiles.git
rm -f .Xresources && ln -s dotfiles/.Xdefaults .Xresources
ln -s dotfiles/.gitconfig .gitconfig
ln -s dotfiles/.commit-template.txt .commit-template.txt
rm -f .zshrc && ln -s dotfiles/.zshrc .zshrc
rm -f .tmux.conf && ln -s dotfiles/.tmux.conf .tmux.conf

#Powerline fonts
mkdir ~/.fonts/
mkdir ~/.config/ && mkdir ~/.config/fontconfig/ 
mkdir ~/.config/fontconfig/conf.d/
wget https://github.com/abertsch/Menlo-for-Powerline/raw/master/Menlo%20for%20Powerline.ttf
mv Menlo* ~/.fonts/
fc-cache -vf ~/.fonts/

