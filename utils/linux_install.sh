#! bin/sh

# only works for arch(will consider expand to other distros as well)

# tweaks to make install programs/packages much faster

# tweak /etc/pacman.conf (using sed if possible)

# # install keyring
# sudo pacman -S archlinux-keyring --noconfirm
#
# # add archlinuxcn
# sudo pacman -S archlinuxcn-keyring --noconfirm
#
# # do a update
# sudo pacman -Syyu --noconfirm
#
#
# sudo pacman -S reflector --noconfirm
# sudo reflector --sort rate --threads 100 -c China --save /etc/pacman.d/mirrorlist
#
# # switch to cn aur mirror
# sudo pacman -S yay paru
# yay --aururl "https://mirrors/aliyun.com/archlinuxcn" --save


# install a bunch of essential programs
sudo pacman -S --needed --noconfirm git\
                                    zsh\
                                    vim\
                                    neovim\
                                    curl\
                                    wget\
                                    aria2\
                                    curlie\
                                    xsel\
                                    neofetch\
                                    bat\
                                    gdu\
                                    btop\
                                    lsd\
                                    ripgrep\
                                    autoconf\
                                    autojump\
                                    automake\
                                    base\
                                    binutils\
                                    bison\
                                    chezmoi\
                                    code-minimap-git\
                                    cowsay\
                                    duf\
                                    fakeroot-tcp\
                                    figlet\
                                    flex\
                                    fzf\
                                    gcc\
                                    gdu\
                                    git\
                                    github-cli\
                                    groff\
                                    lf\
                                    libtool\
                                    m4\
                                    make\
                                    patch\
                                    pkgconf\
                                    python\
                                    texinfo\
                                    tldr\
                                    tmux\
                                    topgrade\
                                    tree\
                                    which\
                                    yay\
                                    zoxide\
                                    zsh\

# setup gitconfig


# install extended programs with paru

# python
paru -S --needed --confirm miniconda
sudo ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
source ~/.zshrc
zsh
conda init zsh


# nodejs
sudo pacman -S --needed --noconfirm nvm nodejs
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc

# gnome remap caps to esc
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
