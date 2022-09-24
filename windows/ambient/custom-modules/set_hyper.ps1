function Link-to-Dotfiles ($x, $y){
if (Test-Path -Path $x){
    Write-Host "$x exists."
    Write-Host "deleting $x"
    Remove-Item -recurse -force $x
}
else {
    Write-Host "$x does not exist."
    Write-Host "Creating $x"
    Write-Host "redirecting..."
}
    New-Item -Path $x -ItemType SymbolicLink -Target $y -Force
    Write-host "$x => $y"
    }

# hyper
$hyperOGConfig="$env:APPDATA\Hyper\.hyper.js"
$dotHyperConfig="$env:USERPROFILE\.dotfiles\windows\hyper\.hyper.js"

# call function(s)
Link-to-Dotfiles $hyperOGConfig $dotHyperConfig
