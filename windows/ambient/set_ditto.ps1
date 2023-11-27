$source_path = "$env:userprofile\scoop\apps\ditto\current\Themes"
$target_path = "$env:userprofile\.dotfiles\windows\Ditto\Themes"

Remove-Item -Path $source_path -Force
New-Item -Path $source_path -ItemType SymbolicLink -Target $target_path -Force
Write-host "ditto settings has been linked to $target_path"
