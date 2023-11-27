. custom-modules\SymbolicLinkFunctions.ps1

# ----------------------------------- cmd -----------------------------------
# cmd/clink
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\alias.cmd" -targetFile "$env:USERPROFILE\alias.cmd"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\init.cmd" -targetFile "$env:USERPROFILE\init.cmd"

<#
# oh-my-posh for cmd/clink
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\oh-my-posh.lua" -targetFile "$env:USERPROFILE\scoop\apps\clink\current\oh-my-posh.lua"
#>

# starship for cmd/clink
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\starship.lua" -targetFile "$env:USERPROFILE\scoop\apps\clink\current\starship.lua"


# ----------------------------------- cmd -----------------------------------
# cmd/clink
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\z.lua" -targetFile "$env:USERPROFILE\scoop\apps\clink\current\z.lua"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\z.cmd" -targetFile "$env:USERPROFILE\scoop\apps\clink\current\z.cmd"

# ----------------------------------- clink -----------------------------------
cmd

clink inject
clink autorun install
clink set clink.logo none
exit
& $home\.dotfiles\windows\cmd\cmd_alias.reg
