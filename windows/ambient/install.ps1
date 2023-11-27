. custom-modules\SymbolicLinkFunctions.ps1
# . custom-modules\New-StartupShortcut.ps1
# . custom-modules\setup_wsl2_proxy.sh
. custom-modules\view_all_symlinks.ps1

# ------------------------------- custom functions ----------------------------

# Aria2
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\aria2.conf" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\aria2.conf"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\aria2.session" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\aria2.session"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\HideRun.vbs" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\HideRun.vbs"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\Start.vbs" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\Start.vbs"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\Status.bat" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\Status.bat"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\Restart.bat" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\Restart.bat"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\StopRun.bat" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\StopRun.bat"


function New-StartupShortcut {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ -PathType 'Leaf'})]
        [string]$TargetFile
    )

    $extension = [System.IO.Path]::GetExtension($TargetFile)
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($TargetFile)
    $shortcutName = "$baseName.lnk"
    $shortcutPath = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\$shortcutName"

    # Create the Windows shortcut
    $WshShell = New-Object -ComObject WScript.Shell
    $shortcut = $WshShell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $TargetFile
    $shortcut.Save()

    Write-Host "Shortcut created at $shortcutPath"

    # Move the shortcut to the Shell:Startup folder
    $shellStartupPath = (New-Object -ComObject Shell.Application).NameSpace("Shell:Startup").Self.Path
    $shortcutDestination = Join-Path -Path $shellStartupPath -ChildPath $shortcutName

    Move-Item -Path $shortcutPath -Destination $shortcutDestination -Force

    Write-Host "Shortcut moved to $shortcutDestination"
}


New-StartupShortcut -TargetFile "$env:USERPROFILE\.dotfiles\windows\aria2\configs\HideRun.vbs"


# Aria2 startup script startup shortcut
# Create a startup shortcut
$shortcutName = "HideRun.lnk"
$targetFile = "$env:USERPROFILE\.dotfiles\windows\aria2\configs\HideRun.vbs"
$shortcutPath = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\$shortcutName"

# Create the Windows shortcut
$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $targetFile
$shortcut.Save()

Write-Host "Shortcut created at $shortcutPath"

# Move the shortcut to the Shell:Startup folder
$shellStartupPath = (New-Object -ComObject Shell.Application).NameSpace("Shell:Startup").Self.Path
$shortcutDestination = Join-Path -Path $shellStartupPath -ChildPath $shortcutName

Move-Item -Path $shortcutPath -Destination $shortcutDestination -Force

Write-Host "Shortcut moved to $shortcutDestination"


# Advanced renamer
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\advanced-renamer\lic.ini" -targetFile "$env:USERPROFILE\scoop\persist\advancedrenamer\Data\lic.ini"

# ditto
Set-SymbolicLink "$env:USERPROFILE\.dotfiles\windows\Ditto\Themes" "$env:USERPROFILE\scoop\apps\ditto\current\Themes"


# ----------------------------------- cmd -----------------------------------
# cmd/clink
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\alias.cmd" -targetFile "$env:USERPROFILE\alias.cmd"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\init.cmd" -targetFile "$env:USERPROFILE\init.cmd"

<#
# oh-my-posh for cmd/clink
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\oh-my-posh.lua" -targetFile "$env:USERPROFILE\scoop\apps\clink\current\oh-my-posh.lua"
#>

# starship for cmd/clink
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\cmd\starship.lua" -targetFile "$env:USERPROFILE\scoop\apps\clink\current\starship.lua"

# z.lua for cmd/clink
New-Item -Path "$env:USERPROFILE\scoop\apps\clink\current\z.lua" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\cmd\z.lua" -Force
Write-host "z.lua has been linked to .dotfiles\windows\cmd\z.lua"

New-Item -Path "$env:USERPROFILE\scoop\apps\clink\current\z.cmd" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\cmd\z.cmd" -Force
Write-host "z.cmd has been linked to .dotfiles\windows\cmd\z.cmd"

# ----------------------------------- clink -----------------------------------
cmd

clink inject
clink autorun install
clink set clink.logo none
exit
& $home\.dotfiles\windows\cmd\cmd_alias.reg

# JPEGView
Set-SymbolicLink "$env:USERPROFILE\.dotfiles\windows\JPEGView\JPEGView.ini" "$env:USERPROFILE\scoop\apps\JPEGView\current\JPEGView.ini"
Set-SymbolicLink "$env:USERPROFILE\.dotfiles\windows\JPEGView\KeyMap.txt" "$env:USERPROFILE\scoop\apps\JPEGView\current\KeyMap.txt"

# Starship
Set-SymbolicLink "$env:USERPROFILE\.dotfiles\common\starship\starship.toml" "$env:USERPROFILE\.config\starship.toml"

# SumatraPDF
Set-SymbolicLink "$env:USERPROFILE\.dotfiles\windows\sumatrapdf\SumatraPDF-settings.txt" "$env:USERPROFILE\scoop\apps\SumatraPDF\current\SumatraPDF-settings.txt"

# Internet Download Manager
Set-SymbolicLink "$env:USERPROFILE\.dotfiles\windows\idm\toolbar" "C:\Program Files (x86)\Internet Download Manager\Toolbar"


# vscodium
Set-SymbolicLink -sourceFile "$env:userprofile\.dotfiles\windows\vscodium\settings.json" -targetFile "$env:userprofile\scoop\persist\vscodium\data\user-data\User\settings.json"

