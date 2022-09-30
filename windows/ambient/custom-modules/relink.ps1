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


# --------------------------->
# SumatraPDf
$SumatraPDFOGConfigPath="$env:LOCALAPPDATA\SumatraPDF\SumatraPDF-settings.txt"
$dotSumatraPDFConfigPath="$env:USERPROFILE\.dotfiles\windows\SumatraPDF\SumatraPDF-settings.txt"

Link-to-Dotfiles $SumatraPDFOGConfigPath $dotSumatraPDFConfigPath


# --------------------------->
# SumatraPDF dracula
# git clone https://github.com/dracula/sumatra-pdf.git "$tempdir\sumatra-pdf-dracula"
#
# Try{Copy-Item "$tempdir\sumatra-pdf-dracula\Dracula.txt" "$migrationDir\SumatraPDF-settings.txt"}
# Catch{"Download sumatrapdf-dracula theme failed, please try again later"}

# --------------------------->
# Ditto themes
$DittoOGConfigPath="C:\Program Files\Ditto\Themes"
$dotDittoConfigPath="$env:USERPROFILE\.dotfiles\windows\Ditto\Themes"

Link-to-Dotfiles $DittoOGConfigPath $dotDittoConfigPath 

# --------------------------->
# Motrix settings
$MotrixOGSysConfigPath="$env:APPDATA\Motrix\system.json"
$dotMotrixSysConfigPath="$env:USERPROFILE\.dotfiles\windows\Motrix\system.json"

Link-to-Dotfiles $MotrixOGSysConfigPath $dotMotrixSysConfigPath 

$MotrixOGUserConfigPath="$env:APPDATA\Motrix\user.json"
$dotMotrixUserConfigPath="$env:USERPROFILE\.dotfiles\windows\Motrix\user.json"

Link-to-Dotfiles $MotrixOGUserConfigPath $dotMotrixUserConfigPath 

