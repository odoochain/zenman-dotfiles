mkdir -force $home/temp

# Source file location
$source = "https://mirror.msys2.org/msys/x86_64/zsh-5.8-5-x86_64.pkg.tar.zst"
# Destination to save the file
$destination = "c:\$env:HOMEPATH\temp\zsh-5.8-5-x86_64.pkg.tar.zst"
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
