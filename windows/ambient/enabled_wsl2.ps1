# Run the script as admin

# enable wsl2 feature
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# enable hyper-V

# enable virtual machine
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# set wsl2 as default
wsl --set-default-version 2


# update linux kernal
wsl --update

# reboot

# First list the names of the installed distributions 
wsl --list 

# Pick the name of the distribution and execute 

# install ubuntu
# change mirror
# setup user and password
# install a bunch of packages
