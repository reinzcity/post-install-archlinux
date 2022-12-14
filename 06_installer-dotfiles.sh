#!/bin/bash

## installing package paru
echo "installing package paru"
paru -S extension-manager
paru -S gnome-shell-extension-blur-my-shell
paru -S gnome-shell-extension-dash-to-dock
paru -S gnome-shell-extension-compiz-alike-magic-lamp-effect
paru -S ntfs-3g

## installing terminal 
echo "installing terminal"
sudo pacman -S kitty fish neofetch ranger tmux exa
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install

## installing starship shell
echo "installing startship"
curl -sS https://starship.rs/install.sh

## clonning my dotfiles
echo "installing dotfiles"
cd $HOME
git clone http://github.com/reinzcity/dotfiles.git
cd dotfiles
yes | cp -rf . ~

## installing font
cd $HOME/dotfiles/.fonts
cp -rf . /usr/share/fonts/TTF/
cd $HOME

## installing homebrew-linux
echo "installing homebrew-linux"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo 'eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)' \ >> ~/.config/fish/config.fish
brew -v
brew update
brew install gcc
cd $HOME

## installing neovim 
echo "installing Neovim"
brew install neovim --HEAD
git clone http://github.com/reinzcity/nvim-2.0
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir $HOME/.config/nvim
cp -rf . $HOME/nvim-2.0/.config/nvim/

cd $HOME
rm -rf $HOME/nvim-2.0

cd $HOME
rm -rf $HOME/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/lua/tokyonight/
mkdir $HOME/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/lua/tokyonight/
cd $HOME/dotfiles/.themes/colorscheme-nvim/tokyonight/
cp -rf . $HOME/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/lua/tokyonight/
cd $HOME

chsh -s /usr/bin/fish

echo " "
echo "<<----======== ALL DONE SUCCESS INSTALL ========---->>"
echo " "
echo "you need restart terminal"
echo " "
echo " "
