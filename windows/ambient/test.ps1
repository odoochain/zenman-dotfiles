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
New-Item -Path "C:$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\common\nvim" -Force
Write-host "nvim has been linked to .dotfiles\common\nvim"



# Questions:
# what is symboliclink?
# what can symbolicklink do?
# Can symbolickLink be delete and restore?
# Can symbolickLink be updated?
# Can you symlink a whole directory?
# Which space does the linked file(s) occupy?
