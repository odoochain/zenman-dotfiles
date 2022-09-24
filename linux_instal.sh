#/bin/bash


#if this is a cli only system
#if this is a desktop system

#using gnome desktop anyways





#know what distro is this

function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge -tv"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}



################################################################################
# homebrew & nix-env
################################################################################

# install homebrew and nix-env anyways



# # set environment variables
# 
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
# 
# # china mirror
# # 从本镜像下载安装脚本并安装 Homebrew / Linuxbrew
# git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
# /bin/bash brew-install/install.sh
# rm -rf brew-install
# 
# # 也可从 GitHub 获取官方安装脚本安装 Homebrew / Linuxbrew
# # /bin/bash -c "$(curl -fsSL https://github.com/Homebrew/install/raw/master/install.sh)"
# 
# 
# # ..
# test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
# test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
# test -r ~/.profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
# test -r ~/.zprofile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zprofile
# 
# 
# # ..
# 
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
# brew tap --custom-remote --force-auto-update homebrew/core https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
# brew tap --custom-remote --force-auto-update homebrew/command-not-found https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
# brew update





# symlinks

# git
rm -f ~/.gitconfig
ln -s -f ~/.dotfiles/linux/git/.gitconfig ~/.gitconfig
echo "=>~/.dotfiles/linux/git/.gitconfig"

# zsh
rm -f ~/.zshrc
ln -s -f ~/.dotfiles/linux/zsh/.zshrc ~/.zshrc
echo "=>~/.dotfiles/linux/zsh/.zshrc"

# pip
rm -f ~/.config/pip
ln -s -f ~/.dotfiles/linux/pip ~/.config/pip
echo "=>~/.dotfiles/linux/pip/pip.conf"


################################################################################
# install minimal vim
################################################################################


#!/bin/bash

# rmdir ~/.config/nvim
#[ -d "~/.config/nvim" ] && [ ! -L "~/.config" ] && echo "Directory ~/.config/nvim exists." || echo "Error: Directory ~/.config/nvim exists but point to $(readlink -f ~/.config/nvim)."

# if [ -d "~/.config/nvim" ];
# then
    # echo "Directory ~/.config/nvim exists."
    # echo "Will delete everything in this directory."
    # rm -rf ~/.config/nvim{*,.*} #this delete also hidden files & directories
# else
    # echo "Error: Directory ~/.config/nvim does not exists."
    # echo "Will create this dir first"
    # mkdir -p ~/.config/nvim
# fi
# 
# git clone --depth=1 https://github.com/mino29/minimal_vim.git ~/.config/nvim
# cd ~/.config/nvim
# sh install.sh





################################################################################
# define main function
################################################################################

function main(){

detect_platform

}







################################################################################
# execute main function with arguments
################################################################################

# main "$@"
main
