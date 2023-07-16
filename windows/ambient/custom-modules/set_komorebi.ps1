<#
# if using scoop
scoop bucket add extras
scoop install whkd
scoop install komorebi
#>

# Enable long paths
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

# save the example configuration to ~/komorebi.json
iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/master/komorebi.example.json -OutFile $Env:USERPROFILE\komorebi.json

# save the latest generated app-specific config tweaks and fixes
komorebic fetch-app-specific-configuration

# ensure the ~/.config folder exists
mkdir $Env:USERPROFILE\.config -ea 0

# save the sample whkdrc file with key bindings to ~/.config/whkdrc
iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/master/whkdrc.sample -OutFile $Env:USERPROFILE\.config\whkdrc

# start komorebi and whkd
komorebic start -c $Env:USERPROFILE\komorebi.json --whkd


# save the latest generated komorebic library to ~/komorebic.lib.ahk
iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/master/komorebic.lib.ahk -OutFile $Env:USERPROFILE\komorebic.lib.ahk

# save the latest generated app-specific config tweaks and fixes to ~/komorebi.generated.ahk
iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/master/komorebi.generated.ahk -OutFile $Env:USERPROFILE\komorebi.generated.ahk

# save the sample komorebi configuration file to ~/komorebi.ahk
iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/master/komorebi.sample.ahk -OutFile $Env:USERPROFILE\komorebi.ahk

# copy-item $home/.dotfiles/windows/komorebi/*.ps1 $home/

# Start Komorebi
#Start-Process komorebi.exe -ArgumentList '--await-configuration' -WindowStyle hidden
