function Set-SymbolicLink {
    param(
        [string]$sourceFile,
        [string]$targetFile
    )

    if (-not (Test-Path -Path $sourceFile)) {
        Write-Host "Source file does not exist. Symbolic link creation aborted."
        return
    }

    if (Test-Path -Path $targetFile) {
        Remove-Item -Path $targetFile -Force
        Write-Host "Existing target file deleted: $targetFile"
    }

    New-Item -Path $targetFile -ItemType SymbolicLink -Target $sourceFile -Force
    Write-Host "Linking $targetFile -> $sourceFile"
}
