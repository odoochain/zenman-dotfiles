$end = read-host "How many times do you want this script to run"
write-host "This script will run $end times."
for ($i=1; $i -le $end; $i++)
    {
    Write-Host "$i out of $end try" -ForegroundColor Blue -BackgroundColor DarkGray
    scoop update --all
    scoop cache rm *; scoop cleanup *
    winget upgrade --all --include-unknown
    }
