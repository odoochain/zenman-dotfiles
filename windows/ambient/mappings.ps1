# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

# Make sure this can install PS modules
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# git
New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\git\gitconfig" -Force
Write-host ".gitconfig has been linked to .dotfiles\common\git\gitconfig"

# mintty-terminal(that comes with git-bash)
New-Item -Path "$env:USERPROFILE\.minttyrc" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\mintty\.minttyrc" -Force
Write-host ".minttyrc has been linked to .dotfiles\windows\mintty\.minttyrc"

# Window-Terminal
New-Item -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\windows-terminal\settings.json" -Force
Write-host "windows terminal settings has been linked to .dotfiles\windows\windows-terminal\settings.json"

# windows powershell(5.1)
New-Item -Path "$env:USERPROFILE\Documents\WindowsPowershell" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\powershell" -Force
Write-host "WindowsPowershell profile config has been linked to .dotfiles\windows\powershell\"

# powershell7
New-Item -Path "$env:USERPROFILE\Documents\Powershell" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\powershell" -Force
Write-host "powershell7 profile config has been linked to .dotfiles\windows\powershell\"

# starship
New-Item -Path "$env:USERPROFILE\.starship" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\.starship" -Force
Write-host "~\.starship has been linked to .dotfiles\common\.starship"

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
Write-host "~\.ideavimrc has been linked to .dotfiles\common\ideam\.ideavimrc"

# Winfetch
New-Item -Path "$env:USERPROFILE\.config\winfetch\config.ps1" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\winfetch\config.ps1" -Force
Write-host "winfetch config has been linked to .dotfiles\windows\winfetch\config.ps1"

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
New-Item -Path "$env:APPDATA\JPEGView" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\JPEGView" -Force
Write-host "JPEGView has been linked to .dotfiles\windows\JPEGView"

# Everything
New-Item -Path "$env:APPDATA\Everything" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\Everything" -Force
Write-host "Everything has been linked to .dotfiles\windows\Everything"

# workspacer
New-Item -Path "$env:USERPROFILE\.workspacer" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\.workspacer" -Force
Write-host "~\.workspacer has been linked to .dotfiles\windows\.workspacer"

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
New-Item -Path "$env:APPDATA\nushell" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\nushell" -Force
Write-host "nushell has been linked to .dotfiles\common\nushell"



# Questions:
# what is symboliclink?
# what can symbolicklink do?
# Can symbolickLink be delete and restore?
# Can symbolickLink be updated?
# Can you symlink a whole directory?
# Which space does the linked file(s) occupy?
