# This is the script to automatically install all the configs that I used for setting up a windows environment

$winTerminalSettingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"
copy-item windows-terminal\settings.json $winTerminalSettingsPath\settings.json


# neovim
git clone https://github.com/Lunarvim/Lunarvim.git "$env:LOCALAPPDATA\nvim"
nvim +PackerSync +qa!
