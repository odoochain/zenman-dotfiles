# Generate a random string of given length
function Generate-RandomString($length) {
    $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    $string = ""

    for ($i = 1; $i -le $length; $i++) {
        $random = Get-Random -Minimum 0 -Maximum $characters.Length
        $string += $characters[$random]
    }

    return $string
}

# Create 10 new folders with random names
for ($i = 1; $i -le 10; $i++) {
    $folderName = Generate-RandomString 16
    New-Item -ItemType Directory -Name ..\Pictures\$folderName
}

