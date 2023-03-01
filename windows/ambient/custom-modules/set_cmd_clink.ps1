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

cmd

clink inject
clink autorun install
clink set clink.logo none
exit
& $home\.dotfiles\windows\cmd\cmd_alias.reg
