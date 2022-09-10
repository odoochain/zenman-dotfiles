# works with powershell in general
Get-ChildItem -Path "C:\Windows\","c:\","$env:USERPROFILE" -Force |
    Where-Object { $_.LinkType -ne $null -or $_.Attributes -match "ReparsePoint" } |
    ft FullName,Length,Attributes,Linktype,Target


# works with powershell 7 only
<#
Get-ChildItem -Path "C:\Windows\","c:\","$env:USERPROFILE" -Force |
  Where-Object { $_.LinkType -ne $null -or $_.Attributes -match "ReparsePoint" -and $_.Length -eq 1 } |
  ft FullName,Attributes,Linktype,Target
#>
