# copy-item $HOME\.dotfiles\windows\aria2\configs\* $HOME\scoop\apps\aria2\current\
# write-host "aria2 configs done"


function Set-SymbolicLink {
    param(
        [string]$sourceFile,
        [string]$targetFile
    )

    if (-not (Test-Path -Path $sourceFile)) {
        Write-Host "Source file does not exist. Symbolic link creation aborted."
        return
    }

    if (Test-Path -Path $targetFile) {
        Remove-Item -Path $targetFile -Force
        Write-Host "Existing target file deleted: $targetFile"
    }

    New-Item -Path $targetFile -ItemType SymbolicLink -Target $sourceFile -Force
    Write-Host "Linking $targetFile -> $sourceFile"
}

Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\aria2.conf" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\aria2.conf"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\aria2.session" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\aria2.session"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\HideRun.vbs" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\HideRun.vbs"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\Start.vbs" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\Start.vbs"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\Status.bat" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\Status.bat"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\Restart.bat" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\Restart.bat"
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\aria2\StopRun.bat" -targetFile "$env:USERPROFILE\scoop\apps\aria2\current\StopRun.bat"

Set-SymbolicLink "$env:USERPROFILE\.dotfiles\windows\advanced-renamer\lic.ini" "$env:USERPROFILE\scoop\persist\advancedrenamer\Data\lic.ini"

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
