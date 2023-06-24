$SourceFilePath = "$env:USERPROFILE\scoop\apps\aria2\current\HideRun.vbs"
$ShortcutPath = "$env:AppData\Microsoft\Windows\Start Menu\Programs\Startup\HideRun.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()
