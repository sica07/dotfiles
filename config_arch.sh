cd
sudo yay -Syu zsh ripgrep  git-extras dictd exa feh flameshot bat lynx xclip rofi-greenclip fd libreoffice-still python-pip \
tig ncdu meld zathura zathura-pdf-mupdf redshift geoclue mpv youtube-dl transalte-shell kitty pcmanfm chromium luakit most gimp cups hplip ripgrep-all \
postman slack-desktop dbeaver skypeforlinux-stable-bin picom \
nodejs-lts-gallium nvm npm \
python-neovim neovim
composer \
git-delta tldr duf xh lazydocker syncthing syncthing-gtk-python3 \
docker docker-compose \
universal-ctags prettyping bottom bluemail \
ranger w3m highlight mediainfo ranger_devicons-git odt2txt \
nerd-fonts-iosevka otf-nerd-fonts-fira-code \
ttf-dejavu ttf-liberation noto-fonts

# font configuration
sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d  &&
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d &&
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d &&
sudo sed 's/#export/export/g' /etc/profile.d/freetype2.sh  &&
sudo cp fonts_local.conf /etc/fonts/local.conf


su && wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts && cat hosts >> /etc/hosts && su marius

#nvim configuration
cd ~/.config && git clone https://github.com/sica07/nvim.git && nvim +PlugInstall

#ZSH configuration
mkdir /home/marius/.local/bin &&
curl -L git.io/antigen > /home/marius/.local/bin/antigen.zsh && chmod +x /home/marius/.local/bin/antigen.zsh
rm ~/.zshrc
ln -s  /home/marius/dotfiles/zshrc ~/.zshrc
chsh -s $(which zsh)

#ranger config
rm -rf ~/.config/ranger/ \
&& ranger --copy-config=all \
&& sed -i 's/preview_images false/preview_images true/g' ~/.config/ranger/rc.conf \
&& cp ranger/rifle.conf ~/.config/ranger/rifle.conf \
&& mkdir ~/.config/ranger/plugins \
&& ln -sf /usr/share/ranger/plugins/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

#customize lynx
rm -rf ~/.config/lynx
cp ~/dotfiles/lynx ~/.config/lynx

#Other configurations
cp dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -s dotfiles/.gitconfig .gitconfig
ln -s dotfiles/.xmodmaprc .xmodmaprc
ln -s dotfiles/.commit-template.txt .commit-template.txt



