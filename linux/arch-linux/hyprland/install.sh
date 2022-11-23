yay -Syu --devel --needed --noconfirm
paru -S -< hyprland-pkgs.txt --needed --noconfirm
chmod +x wrappedhl
mkdir -p ~/.local/bin
cp wrappedhl ~/.local/bin/

mkdir -p ~/.config/hypr
cp hyprland.conf ~/.config/hypr/
