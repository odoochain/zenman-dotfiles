mkdir -p ~/dracula/grub
rm -rf ~/dracula/grub
git clone https://github.com/dracula/grub.git ~/dracula/grub

# Move the dracula folder to /boot/grub/themes
# Change the theme in /etc/default/grub ( Set GRUB_THEME to '/boot/grub/themes/dracula/theme.txt')
# Run sudo grub-mkconfig -o /boot/grub/grub.cfg
