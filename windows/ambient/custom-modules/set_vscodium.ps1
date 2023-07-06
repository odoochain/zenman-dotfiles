$target_path = "$env:userprofile\.dotfiles\windows\vscodium\settings.json"
$source_path = "$env:userprofile\scoop\persist\vscodium\data\user-data\User\settings.json"

Remove-Item -Path $source_path -Force
New-Item -Path $source_path -ItemType SymbolicLink -Target $target_path -Force
Write-host "vscodium settings has been linked to $target_path"

# Remove-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\Keymap.txt" -Force
# New-Item -Path "$env:USERPROFILE\scoop\apps\JPEGView\current\KeyMap.txt" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\JPEGView\KeyMap.txt" -Force
# Write-host "JPEGView KeyMap.txt has been linked to .dotfiles\windows\JPEGView\KeyMap.txt"
