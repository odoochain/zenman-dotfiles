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
Import-Module oh-my-posh
  }catch{
Install-Module -Name oh-my-posh -Scope CurrentUser -Force
    }

# oh-my-posh
try{
Import-Module posh-git
  }catch{
Install-Module -Name posh-git -Scope CurrentUser -Force
    }

# directory jumper
try{
Import-Module z
  }catch{
Install-Module -Name z -Scope CurrentUser -Force
    }

