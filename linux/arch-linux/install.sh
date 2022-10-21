echo "You are setting up arch-linux with gnome desktop"
paru -Syyu --noconfirm

gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
echo "Capsclock has been remapped to Escape"

paru -S --needed --noconfirm -< base-pkgs.txt
paru -S --needed --noconfirm -< gui-pkgs.txt
paru -S --needed --noconfirm -< fonts-pkgs.txt
paru -S --needed --noconfirm -< gnome-pkgs.txt
paru -S --needed --noconfirm -< laptop-pkgs.txt

echo "Installing message apps"
paru -S --needed --noconfirm -< social-pkgs.txt

# echo "setting up dev"
paru -S --needed --noconfirm -< dev-pkgs.txt

# echo "setting up hyprland"
paru -S --needed --noconfirm -< hyprland-pkgs.txt

# echo "setting up i3"
# paru -S --needed --noconfirm -< i3-pkgs.txt


# echo "setting up steam/gaming"
# paru -S --needed --noconfirm -< gaming-pkgs.txt

# sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

paru -S --needed --noconfirm -< im-cn-pkgs.txt
sudo cp environment /etc/environment
echo "fcitx5 has been setup, remember to reboot the system to take effect"

# the usual chrome extensions that I install
# see -> chrome_extensions.txt


# lunarvim

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y


# symlink

ln -s ~/.dotfiles/common/zsh ~/.zshrc
ln -s ~/.dotfiles//linux/git/.gitconfig ~/.gitconfig


# enable bluetooth

sudo systemctl start bluetooth.service
