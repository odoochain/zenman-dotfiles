# Make sure this can install PS modules
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

Try{
    python --version
}
Catch
{
    scoop install python;
    . $home\scoop\apps\python\current\install-pep-514.reg
}


Try{
  poetry --version
  Write-host "poetry is installed on your system."
}
Catch
{

# Install poetry from official script
(Invoke-WebRequest -Uri https://install.python-poetry.org/ -UseBasicParsing).Content | python -

$Env:PATH = "C:\Users\mino29\AppData\Roaming\Python\Scripts\;$Env:PATH"
Write-host "Poetry has been add to path. You can run `poetry --version` to test it out."
}


# $Env:PATH = "C:\Users\mino29\AppData\Roaming\Python\Python39\Scripts;$Env:PATH"
