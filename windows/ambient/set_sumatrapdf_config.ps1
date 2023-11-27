# SumatraPDF

<#
Remove-Item -Path "$env:USERPROFILE\scoop\persist\sumatrapdf\SumatraPDF-settings.txt" -Force
New-Item -Path "$env:USERPROFILE\scoop\persist\sumatrapdf\SumatraPDF-settings.txt" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt" -Force
Write-host "sumatrapdf has been linked to .dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt"

Remove-Item -Path "$env:USERPROFILE\scoop\apps\sumatrapdf\current\SumatraPDF-settings.txt" -Force
New-Item -Path "$env:USERPROFILE\scoop\apps\sumatrapdf\current\SumatraPDF-settings.txt" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt" -Force
Write-host "sumatrapdf has been linked to .dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt"
#>


Remove-Item -Path "$env:USERPROFILE\scoop\persist\sumatrapdf\SumatraPDF-settings.txt" -Force
Copy-Item -Path "$env:USERPROFILE\.dotfiles\windows\sumatrapdf\Default-settings.txt" -Destination "$env:USERPROFILE\scoop\persist\sumatrapdf\SumatraPDF-settings.txt"

Remove-Item -Path "$env:USERPROFILE\scoop\apps\sumatrapdf\current\SumatraPDF-settings.txt" -Force
Copy-Item -Path "$env:USERPROFILE\.dotfiles\windows\sumatrapdf\Default-settings.txt" -Destination "$env:USERPROFILE\scoop\apps\sumatrapdf\current\SumatraPDF-settings.txt"
