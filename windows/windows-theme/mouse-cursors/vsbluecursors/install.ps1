# this works with install.inf file to install/copy cursor files
RUNDLL32.EXE SETUPAPI.DLL,InstallHinfSection DefaultInstall 132 ./install.inf

# reference --> https://learn.microsoft.com/en-us/windows-hardware/drivers/ifs/using-an-inf-file-to-install-a-file-system-filter-driver

# the script can either be .ps1, .bat or .cmd
