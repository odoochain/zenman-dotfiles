Set-ExecutionPolicy Bypass -Scope Process -Force; 

# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

# Make sure this can install PS modules
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install choco
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install a bunch of programs that only listed in choco repo
# choco install roboform
