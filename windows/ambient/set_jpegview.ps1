Remove-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\JPEGView.ini" -Force
New-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\JPEGView.ini" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\JPEGView\JPEGView.ini" -Force
Write-host "JPEGView has been linked to .dotfiles\windows\JPEGView\JPEGView.ini"

Remove-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\Keymap.txt" -Force
New-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\KeyMap.txt" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\JPEGView\KeyMap.txt" -Force
Write-host "JPEGView KeyMap.txt has been linked to .dotfiles\windows\JPEGView\KeyMap.txt"
