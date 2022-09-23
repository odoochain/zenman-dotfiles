$fancyWMConfigPath="$env:LOCALAPPDATA\Packages\2203VeselinKaraganev.FancyWM_9x2ndwrcmyd2c\LocalCache\Roaming\FancyWM"
$dotfancyWMConfigPath="$env:USERPROFILE\.dotfiles\windows\fancyWM"

if (Test-Path -Path $fancyWMConfigPath){
    Write-Host "The given folder exists."
    Write-Host "The folder is going to be deleted"
    Remove-Item -recurse -force $fancyWMConfigPath
}
else {
    Write-Host "The given folder does not exist."
    Write-Host "The folder is going to be created."
    Write-Host "The folder is going to be linked somewhere else."
    New-Item -Path $fancywmConfigPath -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\fancyWM" -Force
    Write-host "fancyWM config has been linked to .dotfiles\windows\fancyWM"
}


New-Item -Path $fancywmConfigPath -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\fancyWM" -Force
