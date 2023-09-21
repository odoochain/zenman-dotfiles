# Custom Functions

open() {
    if [ $# -eq 0 ]; then
         explorer .
    else
        explorer "$1"
    fi
}

pot() {
    if [ $# -eq 0 ]; then
         potplayer .
    else
        potplayer "$1"
    fi
}

rn() {
    if [ $# -eq 0 ]; then
         renamer .
    else
        renamer "$1"
    fi
}


flatten() {
    # If no parameter is provided, use the current directory
    if [ -z "$1" ]; then
        source_directory="."
    else
        source_directory="$1"
    fi

    # Move all files (including files in subdirectories) to the root directory
    find "$source_directory" -type f -exec mv {} "$source_directory" \;
    # Remove all files (directories)
    find "$source_directory" -type d -empty -delete
    # Delete empty directories in the source directory
    find "$source_directory" -type f -size -200M -exec rm -rf {} \;
}
