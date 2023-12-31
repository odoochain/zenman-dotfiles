# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

# Make sure this can install PS modules
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process



# git
New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\git\.gitconfig" -Force
Write-host ".gitconfig has been linked to .dotfiles\common\git\.gitconfig"

# mintty-terminal(that comes with git-bash)
New-Item -Path "$env:USERPROFILE\.minttyrc" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\mintty\.minttyrc" -Force
Write-host ".minttyrc has been linked to .dotfiles\windows\mintty\.minttyrc"

# Window-Terminal
New-Item -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\windows-terminal\settings.json" -Force
Write-host "windows terminal settings has been linked to .dotfiles\windows\windows-terminal\settings.json"

# Window-Terminal-preview
New-Item -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\windows-terminal\settings.json" -Force
Write-host "windows terminal settings has been linked to .dotfiles\windows\windows-terminal\settings.json"

# windows powershell(5.1)
Remove-Item -Path "$env:USERPROFILE\Documents\WindowsPowershell" -Force
New-Item -Path "$env:USERPROFILE\Documents\WindowsPowershell" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\powershell" -Force
Write-host "WindowsPowershell profile config has been linked to .dotfiles\windows\powershell\"

# powershell7
Remove-Item -Path "$env:USERPROFILE\Documents\Powershell" -Force
New-Item -Path "$env:USERPROFILE\Documents\Powershell" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\powershell" -Force
Write-host "powershell7 profile config has been linked to .dotfiles\windows\powershell\"

# starship
# New-Item -Path "$env:USERPROFILE\.starship" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\.starship" -Force
# Write-host "~\.starship has been linked to .dotfiles\common\.starship"

# Python/pip
New-Item -Path "$env:USERPROFILE\pip" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\pip" -Force
Write-host "~\pip has been linked to .dotfiles\windows\pip"

# conda
New-Item -Path "$env:USERPROFILE\.condarc" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\conda\.condarc" -Force
Write-host "~\.condarc has been linked to .dotfiles\common\conda\.condarc"

# npm
New-Item -Path "$env:USERPROFILE\.npmrc" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\npm\.npmrc" -Force
Write-host "~\.npmrc has been linked to .dotfiles\common\npm\.npmrc"


# neovim
New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\nvim" -Force
Write-host "nvim has been linked to .dotfiles\common\nvim"

# vim
New-Item -Path "$env:USERPROFILE\.vimrc" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\vim\.vimrc" -Force
Write-host ".vimrc has been linked to .dotfiles\common\vim\.vimrc"

# ideavim
New-Item -Path "$env:USERPROFILE\.ideavimrc\" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\ideavim\.ideavimrc" -Force
Write-host "~\.ideavimrc has been linked to .dotfiles\common\ideavim\.ideavimrc"

# Winfetch
# New-Item -Path "$env:USERPROFILE\.config\winfetch\config.ps1" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\winfetch\config.ps1" -Force
# Write-host "winfetch config has been linked to .dotfiles\windows\winfetch\config.ps1"

# cmd/clink
New-Item -Path "$env:USERPROFILE\alias.cmd" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\cmd\alias.cmd" -Force
Write-host "alias.cmd has been linked to .dotfiles\windows\cmd\alias.cmd"

New-Item -Path "C:\Users\Public\init.cmd" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\cmd\init.cmd" -Force
Write-host "init.cmd has been linked to .dotfiles\windows\cmd\init.cmd"

New-Item -Path "$env:USERPROFILE\scoop\apps\clink\current\oh-my-posh.lua" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\cmd\oh-my-posh.lua" -Force
Write-host "oh-my-posh.lua has been linked to .dotfiles\windows\cmd\oh-my-posh.lua"

# z.lua for cmd/clink
New-Item -Path "$env:USERPROFILE\scoop\apps\clink\current\z.lua" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\cmd\z.lua" -Force
Write-host "z.lua has been linked to .dotfiles\windows\cmd\z.lua"

New-Item -Path "$env:USERPROFILE\scoop\apps\clink\current\z.cmd" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\cmd\z.cmd" -Force
Write-host "z.cmd has been linked to .dotfiles\windows\cmd\z.cmd"

# lf
New-Item -Path "$env:LOCALAPPDATA\lf" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\lf" -Force
Write-host "~\lf has been linked to .dotfiles\windows\lf"

# JPEGView
Remove-Item -Path "$env:USERPROFILE\scoop\persist\JPEGView\JPEGView.ini" -Force
New-Item -Path "$env:USERPROFILE\scoop\persist\JPEGView\JPEGView.ini" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\JPEGView\JPEGView.ini" -Force
Write-host "JPEGView has been linked to .dotfiles\windows\JPEGView\JPEGView.ini"

Remove-Item -Path "$env:USERPROFILE\scoop\persist\JPEGView\Keymap.txt" -Force
New-Item -Path "$env:USERPROFILE\scoop\persist\JPEGView\KeyMap.txt" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\JPEGView\KeyMap.txt" -Force
Write-host "JPEGView KeyMap.txt has been linked to .dotfiles\windows\JPEGView\KeyMap.txt"

Remove-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\JPEGView.ini" -Force
New-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\JPEGView.ini" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\JPEGView\JPEGView.ini" -Force
Write-host "JPEGView has been linked to .dotfiles\windows\JPEGView\JPEGView.ini"

Remove-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\Keymap.txt" -Force
New-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\KeyMap.txt" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\JPEGView\KeyMap.txt" -Force
Write-host "JPEGView KeyMap.txt has been linked to .dotfiles\windows\JPEGView\KeyMap.txt"

# Everything
New-Item -Path "$env:APPDATA\Everything" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\Everything" -Force
New-Item -Path "$env:ProgramFiles\Everything 1.5a\Everything-1.5a.ini" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\Everything\everything-1.5a.ini" -Force
Write-host "Everything has been linked to .dotfiles\windows\Everything"


# SumatraPDF
Remove-Item -Path "$env:USERPROFILE\scoop\persist\Sumatrapdf\SumatraPDF-settings.txt" -Force
New-Item -Path "$env:USERPROFILE\scoop\persist\sumatrapdf\SumatraPDF-settings.txt" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt" -Force
Write-host "sumatrapdf has been linked to .dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt"

Remove-Item -Path "$env:USERPROFILE\scoop\apps\Sumatrapdf\current\SumatraPDF-settings.txt" -Force
New-Item -Path "$env:USERPROFILE\scoop\apps\sumatrapdf\current\SumatraPDF-settings.txt" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt" -Force
Write-host "sumatrapdf has been linked to .dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt"

# git-bash, zsh and p10k
New-Item -Path "$env:USERPROFILE\.bashrc" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\bash\.bashrc" -Force
Write-host "~\.bashrc has been linked to .dotfiles\windows\bash\.bashrc"

New-Item -Path "$env:USERPROFILE\.bash_profile" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\bash\.bashrc" -Force
Write-host "~\.bashrc has been linked to .dotfiles\windows\bash\.bashrc"

#zsh
New-Item -Path "$env:USERPROFILE\.zshrc" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\zsh\.zshrc" -Force
Write-host "~\.zshrc has been linked to .dotfiles\windows\zsh\.zshrc"


#p10k/powerlevel10k
New-Item -Path "$env:USERPROFILE\.p10k.zsh" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\zsh\.p10k.zsh" -Force
Write-host "~\.p10k.zsh has been linked to .dotfiles\windows\zsh\.p10k.zsh"


#nushell
# New-Item -Path "$env:APPDATA\nushell" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\nushell" -Force
# Write-host "nushell has been linked to .dotfiles\common\nushell"


# yasb
# Remove-Item -recurse -force "$env:USERPROFILE\.yasb"
#New-Item -Path "$env:USERPROFILE\.yasb" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\.yasb" -Force
#Write-host "~\.local\share\yasb has been linked to .dotfiles\windows\yasb"

# komorebi
# Remove-Item -recurse -force "$env:USERPROFILE\.config\komorebi"
# New-Item -Path "$env:USERPROFILE\.config\komorebi" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\komorebi" -Force
# Write-host "~\.config\komorebi has been linked to .dotfiles\windows\komorebi"

Remove-Item -force "$env:USERPROFILE\komorebi.ps1"
Remove-Item -force "$env:USERPROFILE\komorebi.generated.ps1"
New-Item -Path "$env:USERPROFILE\komorebi.ps1" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\komorebi.ps1" -Force
New-Item -Path "$env:USERPROFILE\komorebi.generated.ps1" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\komorebi.generated.ps1" -Force
Write-host "~\.config\komorebi has been linked to .dotfiles\windows\komorebi"

# FancyWM

# $fancywmConfigPath="$env:LOCALAPPDATA\Packages\2203VeselinKaraganev.FancyWM_9x2ndwrcmyd2c\LocalCache\Roaming\FancyWM"
# New-Item -Path $fancywmConfigPath -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\fancyWM" -Force
# Write-host "fancyWM config has been linked to .dotfiles\windows\fancyWM"


# wmhotkeys
# $wmhotkeysPath="$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\wmhotkeys.ahk"
# New-Item -Path $wmhotkeysPath -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\startup\wmhotkeys" -Force
# Write-host "wmhotkeys config has been linked to .dotfiles\windows\startup\wmhotkeys"

New-Item -Path "$env:USERPROFILE\.config\starship.toml" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\starship\starship.toml" -Force
Write-host "starship.toml has been linked to .dotfiles\common\starship\starship.toml"
