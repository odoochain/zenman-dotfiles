# change windows temrinal json
#
# (Get-Content $home\.dotfiles\windows\windows-terminal\settings.json).replace('mino29', $env:USERNAME) | Set-Content $home\.dotfiles\windows\windows-terminal\settings.json
# change powershell conda profile
#
 #(Get-Content $home\.dotfiles\windows\powershell\profile.ps1).replace('mino29', $env:USERNAME) | Set-Content $home\.dotfiles\windows\powershell\profile.ps1

# Write-Host "settings adjusted to current user path"

# revert to "mino29"

# change windows temrinal json
(Get-Content $home\.dotfiles\windows\windows-terminal\settings.json).replace('Lenovo', 'mino29') | Set-Content $home\.dotfiles\windows\windows-terminal\settings.json
# change powershell conda profile
(Get-Content $home\.dotfiles\windows\powershell\profile.ps1).replace('Lenovo', 'mino29') | Set-Content $home\.dotfiles\windows\powershell\profile.ps1

Write-Host "settings adjusted to 'mino29' user path"
