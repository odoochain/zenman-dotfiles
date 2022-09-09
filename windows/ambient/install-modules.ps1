# terminal icons
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
# oh-my-posh
Install-Module -Name oh-my-posh -Scope CurrentUser -Force
# oh-my-posh
Install-Module -Name posh-git -Scope CurrentUser -Force
# directory jumper
Install-Module -Name z -Scope CurrentUser -Force
# autocompletion
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck



# Install-Module -Confirm -Name CaptureIT -RequiredVersion 1.0.1.47
# Install-Module -Confirm -Name PackageManagement -RequiredVersion 1.4.7
# Install-Module -Confirm -Name PendingReboot -RequiredVersion 0.9.0.6





try{
Import-Module PSReadLine
}catch{
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
}
