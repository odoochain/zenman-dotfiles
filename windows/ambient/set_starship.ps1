New-Item -Path "$env:USERPROFILE\.config\starship.toml" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\common\starship\starship.toml" -Force
Write-host "starship.toml has been linked to .dotfiles\common\starship\starship.toml"
