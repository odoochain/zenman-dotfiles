<#

What needs to be done:

1-make sure powershell can run scripts
2-make sure clash-for-windows runs
3-make sure winget is installed (so I can install git, windows temrinal, powershell, sharpkeys)
4-clone minimal_vim, dotfiles

5-make sure powershell itself can get all the things working(withou much external package manager)
6-setup scoop and install a bunch of programs
7-setup github-cli ready to code
8-silently install a bunch of gui apps (cracked)
9-setup apps that cannot be setup by script


#>

Try{
    winget --version
    }
Catch{
    Invoke-WebRequest https://raw.githubusercontent.com/mino29/dotfiles/master/utils/installers/install-winget.ps1 -UseBasicParsing | Invoke-Expression
}

winget install Microsoft.WindowsTerminal
winget install git.git
winget install JanDebobbeleer.OhMyPosh
winget install Neovim.Neovim
winget install Microsoft.PowerShell.Preview
winget install Fndroid.ClashForWindows
winget install GyDi.ClashVerge
winget insatll RandyRants.SharpKeys
winget install Anaconda.Anaconda3
winget install voidtools.Everything.Alpha

# setup a usable profile

# Invoke-WebRequest https://raw.githubusercontent.com/mino29/minimal_vim/master/utils/install.ps1 -UseBasicParsing | Invoke-Expression
