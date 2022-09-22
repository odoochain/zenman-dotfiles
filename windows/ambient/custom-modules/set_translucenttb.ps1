$x="$env:APPDATA\TranslucentTB"
$y="$env:USERPROFILE\.dotfiles\windows\TranslucentTB"

function Link-to-Dotfiles ($x, $y){
if (Test-Path -Path $x){
    Write-Host "The given folder exists."
    Write-Host "The folder is going to be deleted"
    Remove-Item -recurse -force $x
}
else {
    Write-Host "The given folder does not exist."
    Write-Host "The folder is going to be created."
    Write-Host "The folder is going to be linked somewhere else."
}
    New-Item -Path $x -ItemType SymbolicLink -Target $y -Force
    Write-host "TranslucentTB config has been linked to .dotfiles\windows\TranslucentTB"
    }

Link-to-Dotfiles $x $y
