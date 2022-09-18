$url = "https://download.scdn.co/SpotifySetup.exe"
$spotifyPath = "$home\gwarpintor.exe"
Invoke-WebRequest -Uri $url -OutFile $spotifyPath
& $spotifyPath
