sudo pacman -S reflector --noconfirm
reflector --verbose --completion-percent 100 --ipv6 --protocol https --score 50 --sort rate --save /etc/pacman.d/mirrorlist



