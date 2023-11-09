param (
    [string]$DatabasePath
)

# Start SQLite3 with the -init option and the specified database path
& sqlite3.exe -init "$ENV:USERPROFILE\.sqlite3\init.sql" $DatabasePath
