# mv "$env:LOCALAPPDATA\SumatraPDF\SumatraPDF-settings.txt"


################################################################################
#####################  colorful console message  ###############################
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
#####################  set environment/global variable   #######################
################################################################################

$tempDir="$env:USERPROFILE\temp\"
$migrationDir="$env:USERPROFILE\migration\"

if (Test-Path -Path $migrationDir){}
else {New-Item -Path $migrationDir -ItemType Directory}
remindMsg("Download files goes --> $tempDir")

if (Test-Path -Path $tempDir){}
else {New-Item -Path $tempDir -ItemType Directory}
remindMsg("Backup files goes --> $migrationDir")

################################################################################
#####################   backup and relink  #####################################
################################################################################

function Link-to-Dotfiles ($x, $y, $name){
if (Test-Path -Path $x){
    remindMsg "$x exists."
    warnMsg "deleting $x"
    # Remove-Item -recurse -force $x
    # backup the original file(s)/directory
    Copy-Item -recurse $x $migrationDir
}
else {
    remindMsg "$x does not exist."
    Write-Host "Creating $x"
    Write-Host "redirecting..."
}
    # New-Item -Path $x -ItemType SymbolicLink -Target $y -Force
    successMsg "$x => $y"
    }

# for more application settings, we need to create a hashtable

# SumatraPDf
$SumatraPDFOGConfigPath="$env:LOCALAPPDATA\SumatraPDF\SumatraPDF-settings.txt"
$dotSumatraPDFConfigPath="$env:USERPROFILE\.dotfiles\windows\SumatraPDF"
$appName="SumatraPDF"

# call function(s)
# remindMsg($tempDir)
# warnMsg("You are going to die, some day")
# successMsg("You won the lottery, congrats!")

# Link-to-Dotfiles $SumatraPDFOGConfigPath $dotSumatraPDFConfigPath $appName

# SumatraPDF dracula
git clone https://github.com/dracula/sumatra-pdf.git "$tempdir\sumatra-pdf-dracula"

Try{Copy-Item "$tempdir\sumatra-pdf-dracula\Dracula.txt" "$migrationDir\SumatraPDF-settings.txt"}
Catch{"Download sumatrapdf-dracula theme failed, please try again later"}
