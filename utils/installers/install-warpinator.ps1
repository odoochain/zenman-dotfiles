$url = "https://github.com/slowscript/warpinator-windows/releases/download/v0.2/warpinator-setup_0.2.exe"
$warpinatorPath = "$home\gwarpintor.exe"
Invoke-WebRequest -Uri $url -OutFile $warpinatorPath
& $warpinatorPath
