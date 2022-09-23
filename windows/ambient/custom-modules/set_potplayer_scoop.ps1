$PotPlayerConfig="$env:USERPROFILE\scoop\apps\potplayer\PotPlayer64.ini"
$dotPotPlayerConfig="$env:USERPROFILE\.dotfiles\windows\potplayer\PotPlayer64.ini"

$PotPlayerSkin="$env:USERPROFILE\scoop\apps\current\potplayer\Skins\Kardox.dsf"
$dotPotPlayerSkin="$env:USERPROFILE\.dotfiles\windows\potplayer\Kardox.dsf"

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
    Write-host "potplayer config has been linked to .dotfiles\windows\potplayer"
    }

Link-to-Dotfiles $PotPlayerConfig $dotPotPlayerConfig
Link-to-Dotfiles $PotPlayerSkin $dotPotPlayerSkin
