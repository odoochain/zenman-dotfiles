# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

Try{
  choco --version
  Write-host "choco is installed on your system."
}
Catch
{
# Make sure this can install 
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install choco from official script
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco feature enable -n allowGlobalConfirmation

Write-host "Choco has been add to path. You can run `choco --version` to test it out."

}


# Install a bunch of programs that only listed in choco repo
choco install choco_packages.config
