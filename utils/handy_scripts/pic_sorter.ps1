$source_path = "$HOME\Downloads\"
$target_path = "D:\Pictures\Untagged\"


$file_count = (gci -path $source_path -file).count

gci $source_path -file | mv -destination $target_path

Write-Host "$file_count image files have been moved."
