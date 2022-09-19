Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# autocompletion
try{
Import-Module PSReadLine
}catch{
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
}

# terminal icons
try{
Import-Module Terminal-Icons
  }catch{
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
    }

# oh-my-posh
try{
Import-Module posh-git
  }catch{
Install-Module -Name posh-git -Scope CurrentUser -Force
    }

# PSwindowsUpdate
try{
Import-Module PSWindowsUpdate
  }catch{
Install-Module -Name PSWindowsUpdate -Scope CurrentUser -Force
    }
