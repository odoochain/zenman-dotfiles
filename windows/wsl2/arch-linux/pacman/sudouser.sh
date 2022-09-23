pacman -S zsh --noconfirm --needed
cp sudoers /etc/sudoers
useradd -m -G wheel,sudo -s/bin/zsh mino29
passwd mino29
