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


# workflow:
# see if the file/folder exists, (if doesn't exist, do symlink), (else, remove by force recursively, then do symlink)
# show prompt the original path --> the new file path

# git
rm -f ~/.gitconfig
ln -s -f ~/.dotfiles/linux/git/.gitconfig ~/.gitconfig
echo "=> ~/.dotfiles/linux/git/.gitconfig"

# bash-->main rc
rm -f ~/.bashrc
ln -s -f ~/.dotfiles/common/bash/.bashrc ~/.bashrc
echo "=> ~/.dotfiles/common/bash/.bashrc"
# bash-->logout
rm -f ~/.bash_logout
ln -s -f ~/.dotfiles/common/bash/.bash_logout ~/.bash_logout
# bash-->profile
rm -f ~/.bash_profile
ln -s -f ~/.dotfiles/common/bash/.bash_profile ~/.bash_profile

# zsh
rm -f ~/.zshrc
ln -s -f ~/.dotfiles/common/zsh/.zshrc ~/.zshrc
echo "=> ~/.dotfiles/common/zsh/.zshrc"

rm -f ~/.p10k.zsh
ln -s -f ~/.dotfiles/common/zsh/.p10k.zsh ~/.p10k.zsh
echo "=> ~/.dotfiles/common/zsh/.p10k.zsh"

# pip
rm -f ~/.config/pip
ln -s -f ~/.dotfiles/linux/pip ~/.config/pip
echo "=> ~/.dotfiles/linux/pip/pip.conf"

# neovim
rm -f ~/.config/nvim
ln -s -f ~/.dotfiles/common/nvim ~/.config/nvim
echo "=> ~/.dotfiles/linux/nvim"

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
# arch-linux specific
################################################################################

# arch pacman cn mirror

# /etc/pacman.conf
sed -i "/archlinuxcn/d" /etc/pacman.conf
printf "[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch" >> /etc/pacman.conf

# /etc/pacman.d/mirrorlist
sed -i "/\.cn/s/^#//g" /etc/pacman.d/mirrorlist

# or use reflector

sudo pacman -Sy
sudo pacman -S --needed --noconfirm archlinux-keyring\
                                    archlinuxcn-keyring\
                                    reflector\
                                              git\
                                              git-delta\
                                              yay\
                                              paru\
                                              neovim\

#aur cn mirror
yay --aururl "https://mirrors.aliyun.com/archlinuxcn" --save


# rust
rustup default stable

################################################################################
# awesome window manager
################################################################################



################################################################################
# zsh/oh-my-zsh/powerlevel10k/zsh-autosuggestions/zsh-syntax-highlighting
################################################################################



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
