################################################################################
#####################  run as admin
################################################################################


# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

################################################################################
#####################  Bypass, make sure this script can runl
################################################################################

# Make sure this can install PS modules
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

################################################################################
#####################  colorful console message
################################################################################

function remindMsg ($word){
        Write-Host -Backgroundcolor Yellow -Foregroundcolor Black $word
    }

function warnMsg ($word){
        Write-Host -Backgroundcolor Red -Foregroundcolor White $word
    }

function successMsg ($word){
        Write-Host -Backgroundcolor Green -Foregroundcolor Black $word
    }

################################################################################
#####################  set environment/global variable
################################################################################

$tempDir="$env:USERPROFILE\temp"
$migrationDir="$env:USERPROFILE\migration"

if (Test-Path -Path $migrationDir){}
else {New-Item -Path $migrationDir -ItemType Directory}
remindMsg("Download files goes --> $tempDir")

if (Test-Path -Path $tempDir){}
else {New-Item -Path $tempDir -ItemType Directory}
remindMsg("Backup files goes --> $migrationDir")

################################################################################
#####################   backup and relink
################################################################################

function Link-to-Dotfiles ($x, $y){
if (Test-Path -Path $x){
    remindMsg "$x exists."
    warnMsg "deleting $x"
    Remove-Item -recurse -force $x
    # backup the original file(s)/directory
    # Copy-Item -recurse $x $migrationDir
}
else {
    remindMsg "$x does not exist."
    Write-Host "Creating $x"
    Write-Host "redirecting..."
}
    New-Item -Path $x -ItemType SymbolicLink -Target $y -Force
    successMsg "$x => $y"
    }

# for more application settings, we need to create a hashtable

################################################################################
#####################   Call functions
################################################################################



# Window-Terminal-preview

# $WindowsTerminalPreviewOGUserConfigPath="$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"
# $dotWindowsTerminalPreviewOGUserConfigPath="$env:USERPROFILE\.dotfiles\windows\windows-terminal\settings.json"
#
#
# Link-to-Dotfiles $WindowsTerminalPreviewOGUserConfigPath $dotWindowsTerminalPreviewOGUserConfigPath

