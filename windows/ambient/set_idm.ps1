
$source_path = "$HOME\.dotfiles\windows\idm\toolbar\"
$target_path = "C:\Program Files (x86)\Internet Download Manager\Toolbar\"

# Delete all files and subdirectories in the target path
Remove-Item -Path $target_path\* -Force -Recurse

# Copy all files and subdirectories from the source path to the target path
Copy-Item -Path $source_path\* -Destination $target_path -Force -Recurse

