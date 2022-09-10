# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

# git
New-Item -Path "C:$env:HOMEPATH\.gitconfig" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\common\.gitconfig" -Force
Write-host ".gitconfig has been linked to .dotfiles\common\.gitconfig"

# pip
New-Item -Path "C:$env:HOMEPATH\pip" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\pip" -Force
Write-host "~\pip has been linked to .dotfiles\windows\pip"

# neovim
New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\common\nvim" -Force
Write-host "nvim has been linked to .dotfiles\common\nvim"


# Winfetch
New-Item -Path "C:$env:HOMEPATH\.config\winfetch\config.ps1" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\winfetch\config.ps1" -Force
Write-host "winfetch config has been linked to .dotfiles\windows\winfetch\config.ps1"

# windows powershell(5.1)
New-Item -Path "C:$env:HOMEPATH\Documents\WindowsPowershell\Microsoft.Powershell_profile.ps1" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\powershell\Microsoft.Powershell_profile.ps1" -Force
Write-host "WindowsPowershell profile config has been linked to .dotfiles\windows\powershell\Microsoft.Powershell_profile.ps1"

# powershell7
New-Item -Path "C:$env:HOMEPATH\Documents\Powershell\Microsoft.Powershell_profile.ps1" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\powershell\Microsoft.Powershell_profile.ps1" -Force
Write-host "powershell7 profile config has been linked to .dotfiles\windows\powershell\Microsoft.Powershell_profile.ps1"

# cmd/clink

New-Item -Path "C:$env:HOMEPATH\alias.cmd" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\cmd\alias.cmd" -Force
Write-host "alias.cmd has been linked to .dotfiles\windows\cmd\alias.cmd"


New-Item -Path "C:\Users\Public\init.cmd" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\cmd\init.cmd" -Force
Write-host "init.cmd has been linked to .dotfiles\windows\cmd\init.cmd"

New-Item -Path "C:$env:HOMEPATH\scoop\apps\clink\current\oh-my-posh.lua" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\cmd\oh-my-posh.lua" -Force
Write-host "oh-my-posh.lua has been linked to .dotfiles\windows\cmd\oh-my-posh.lua"

New-Item -Path "C:$env:HOMEPATH\scoop\apps\clink\current\z.lua" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\cmd\z.lua" -Force
Write-host "z.lua has been linked to .dotfiles\windows\cmd\z.lua"

New-Item -Path "C:$env:HOMEPATH\scoop\apps\clink\current\z.cmd" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\windows\cmd\z.cmd" -Force
Write-host "z.cmd has been linked to .dotfiles\windows\cmd\z.cmd"

# lf
New-Item -Path "$env:LOCALAPPDATA\lf" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\common\lf" -Force
Write-host "~\lf has been linked to .dotfiles\windows\lf"

# Questions:
# what is symboliclink?
# what can symbolicklink do?
# Can symbolickLink be delete and restore?
# Can symbolickLink be updated?
# Can you symlink a whole directory?
# Which space does the linked file(s) occupy?
