# This is the script to automatically install all the configs that I used for setting up a windows environment

# link various profiles to $home\.config\<program profiles>

# git
New-Item -Path "C:$env:HOMEPATH\.gitconfig" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\.gitconfig" -Force

# powershell
New-Item -Path "C:$env:HOMEPATH\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\.profile.ps1" -Force
New-Item -Path "C:$env:HOMEPATH\Documents\PowerShell\Microsoft.VSCode_profile.ps1" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\.codeprofile.ps1" -Force

# windows terminal
New-Item -Path "C:$env:HOMEPATH\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\.wterm.json" -Force

# neovim
New-Item -Path "C:$env:HOMEPATH\AppData\Local\nvim\init.lua" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\nvim\init.lua" -Force

# oh-my-posh
New-Item -Path "C:$env:HOMEPATH\Programs\oh-my-posh\themes\my_schema1.json" -ItemType SymbolicLink -Target "C:$env:HOMEPATH\.dotfiles\.posh.json" -Force

# Winfetch
New-Item -Path "~\.config\winfetch\config.ps1" -ItemType SymbolicLink -Target "~\.dotfiles\.winf.ps1" -Force

# Python/pip
New-Item -Path "~\pip\pip.ini" -ItemType SymbolicLink -Target "~\.dotfiles\pip\pip.ini" -Force

# $winTerminalSettingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"
# copy-item windows-terminal\settings.json $winTerminalSettingsPath\settings.json

# # neovim
# git clone https://github.com/Lunarvim/Lunarvim.git "$env:LOCALAPPDATA\nvim"
# nvim +PackerSync +qa!
