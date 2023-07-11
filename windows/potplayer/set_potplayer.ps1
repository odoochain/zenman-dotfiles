
$source_ini_path = "$HOME\.dotfiles\windows\potplayer\PotPlayer64.ini"
$target_ini_path = "$HOME\scoop\persist\potplayer\PotPlayer64.ini"

# $source_skin_path = "$HOME\.dotfiles\windows\potplayer\Kardox.dsf"
# $target_skin_path = "$HOME\scoop\persist\potplayer\Kardox.dsf"

Copy-Item -Path $source_ini_path -Destination $target_ini_path -force
