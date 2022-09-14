

function section($text) {
	<#
        .SYNOPSIS
        Prints a section divider for easy reading of the output.

        .DESCRIPTION
        Prints a section divider for easy reading of the output.
    #>
	Write-Output "###################################"
	Write-Output "# $text"
	Write-Output "###################################"
}

$url = "https://cdn.desktop.baimiaoapp.com/updater/download/latest/baimiao_windows.zip"
$zipFile = "baimiao_windows.zip"

Invoke-WebRequest -Uri $url -OutFile $zipFile

section("Extracting msi file from zip file...")
Expand-Archive $zipFile

# TODO: silently install the msi file

section("Installing...")
Start-Process "baimiao_windows\白描桌面版_0.2.2_x64_zh-CN.msi" -ArgumentList "/quiet /passive"

section("Cleaning...")
Remove-Item -Recurse -Force baimiao_windows.zip
Remove-Item -Recurse -Force baimiao_windows
