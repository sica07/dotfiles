cd
sudo yay -Syu zsh ripgrep  git-extras dict exa feh flameshot bat pandoc lynx xclip rofi-greenclip fd \
tig ncdu meld zathura redshift geoclue mpv transalte-shell kitty pcmanfm chromium luakit\
postman slack dbeaver dropbox \
nodejs-lts-gallium nvm npm \
git-delta tldr duf xh lazydocker \
docker docker-compose \
universal-ctags prettyping bottom bluemail \
ranger w3m-imgcat highlight mediainfo ranger_devicons-git \
nerd-fonts-iosevka otf-nerd-fonts-fira-code

#nvim configuration
cd ~/.config && git clone https://github.com/sica07/nvim.git && nvim +PlugInstall

#ZSH configuration
mkdir /home/mariusm/.local/bin &&
curl -L git.io/antigen > /home/mariusm/.local/bin/antigen.zsh && chmod +x /home/mariusm/.local/bin/antigen.zsh
rm ~/.zshrc
ln -s  /home/mariusm/dotfiles/zshrc ~/.zshrc
chsh -s $(which zsh)

#ranger config
rm -rf ~/.config/ranger/ \
&& ranger --copy-config=all \
&& sed -i 's/preview_images false/preview_images true/g' ~/.config/ranger/rc.conf \
&& cp ranger/rifle.conf ~/.config/ranger/rifle.conf

#customize lynx
rm -rf ~/.config/lynx
cp ~/dotfiles/lynx ~/.config/lynx

#Other configurations
cp dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -s dotfiles/.gitconfig .gitconfig
ln -s dotfiles/.xmodmaprc .xmodmaprc
ln -s dotfiles/.commit-template.txt .commit-template.txt



