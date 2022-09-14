#!/bin/bash

# make sure to connect to github
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export ALL_PROXY="http://$host_ip:7890"

# Clone the git to the .vim directory of home
git clone https://github.com/mino29/meovim.git ~/.config/nvim

# Brows like a pro with ctags
sudo apt install universal-ctags

# copy my essential nvim config file
cp -r nvim ~/.config/

# install plugins in vim with vim plug
echo "Installing plugins"
nvim +PackerSync +qa!

# install coc.nvim
nvim +CocUpdate +qa!

# Give feedback that we installed the ultimate vimrc
echo "Meovim insatlled, meow~"
