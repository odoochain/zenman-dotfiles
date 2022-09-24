#! bin/sh


# only works for arch(will consider expand to other distros as well

# tweaks to make install programs/packages much faster

sudo pacman -S reflector --noconfirm
sudo reflector --sort rate --threads 100 -c China --save /etc/pacman.d/mirrorlist



sudo reflector --country China --age 72 --sort rate --protocol https --save /etc/pacman.d/mirrorlist


