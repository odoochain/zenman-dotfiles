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
    Write-host "$x --> $y"
    }

# hyper
$hyperOGConfig="$env:APPDATA\Hyper\.hyper.js"
$dotHyperConfig="$env:USERPROFILE\.dotfiles\windows\hyper\.hyper.js"
Link-to-Dotfiles $hyperOGConfig $dotHyperConfig
