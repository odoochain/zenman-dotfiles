
# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

Try{
  scoop --version
  Write-host "scoop is installed on your system."
}
Catch
{
# Make sure this can install PS modules
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Install scoop from official script
irm get.scoop.sh | iex

Write-host "scoop has been add to path. You can run `scoop --version` to test it out."

#TODO: add more buckets
#TODO: test the buckets added successfully

# most basic scoop packages
# need to simply these, way too many duplicate lines
scoop install git
scoop install 7zip
scoop install sudo
scoop install aria2
scoop install dark
scoop install lessmsi
scoop install gcc
scoop inistall adb
scoop inistall busybox
scoop inistall CascadiaCode-NF
scoop inistall FiraCode-NF
scoop inistall Hack-NF
scoop inistall colortool
scoop inistall ffmpeg
scoop inistall figlet
scoop inistall innounp
scoop inistall iperf3
scoop inistall lxrunoffline
scoop inistall winfetch
scoop inistall nodejs-lts
scoop inistall python
scoop inistall rclone
scoop inistall rufus
scoop inistall screentogif
}


# to unset scoop proxy
# scoop config rm proxy

# $Env:PATH = "C:\Users\mino29\AppData\Roaming\Python\Python39\Scripts;$Env:PATH"
#

Try{
    scoop checkup
    }
Catch{
    scoop install git
    }

Try{
    git --version
    }
Catch{
    scoop install git
    }

Try{
    7z
    }
Catch{
    scoop install 7zip
    }

Try{
    aria2c --version
    }
Catch{
    scoop install aria2
    }

