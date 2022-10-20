sudo pacman -Syyu --noconfirm
sudo pacman -S --needed --noconfirm i3-gaps\
                                    i3-wm\
                                    i3blocks\
                                    i3lock\
                                    i3status\
                                    firefox\
                                    dmenu\
                                    nitrogen\
                                    alacritty\
                                    lightdm\
                                    lightdm-gtk-settings\
                                    lightdm-gtk-greeter\
sudo systemctl enable lightdm
