
#------------------------------- Startup settings BEGIN -----------------------

# Remove those annoying startup powershell info when possible
# Clear-Host

#------------------------------- Startup settings END -------------------------

# Chocolatey profile
Try {
    $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    if (Test-Path($ChocolateyProfile)) {
        Import-Module "$ChocolateyProfile"
    }
}
Catch {
    # install chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

<#
 * FileName: Microsoft.PowerShell_profile.ps1
 * Author: Wu Zhongzheng
 * Email: zhongzheng.wu@outlook.com
 * Date: 2022, Sep. 9
 * Copyright: No copyright. You can use this code for anything with no warranty.
#>

#------------------------------- Import Modules BEGIN -------------------------


# 引入 oh-my-posh
# 设置 PowerShell 主题
# mydesktop--> MARCY (bigger screen, better with pwsh10k_norse)
# mylaptop--> HILDA (smaller screen, better with polarnord)
# others--> (use pwsh10k_norse by default)

$hostname = hostname
Try {
    # if ($hostname -eq "HILDA") {
        # oh-my-posh init pwsh --config "$home\.dotfiles\windows\oh-my-posh\themes\polarnord.omp.json" | Invoke-Expression
        # }
    # elseif ($hostname -eq "MARCY"){
        # oh-my-posh init pwsh --config "$home\.dotfiles\windows\oh-my-posh\themes\pwsh10k_norse.omp.json" | Invoke-Expression
        # }
    # else{
        # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\pure.omp.json" | Invoke-Expression
        # }
        # oh-my-posh init pwsh --config "$home\.dotfiles\windows\oh-my-posh\themes\polarnord.omp.json" | Invoke-Expression
        oh-my-posh init pwsh --config "$home\.dotfiles\windows\oh-my-posh\themes\minimal.omp.json" | Invoke-Expression
}
Catch {
    winget install JanDeDobbeleer.OhMyPosh
}


# 引入 posh-git
Try {
    Import-Module posh-git
}
Catch {
    Install-Module posh-git -Scope CurrentUser -AllowClobber -Force  ## posh-git git美化管理包
}


# 引入 ps-read-line
Try {
    Import-Module PSReadLine
}
Catch {
    Install-Module PSReadLine -Scope CurrentUser -AllowPrerelease - SkipPublisherChecke -Force  ## posh-git git美化管理包
}

# 引入terminal-icons
Try {
    Import-Module -Name Terminal-Icons
}
Catch {
    Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force # oh-my-posh 基础美化工具包
}

# 引入Zlocation (powerful cd)
# full command-let is invoke-Zlocation, z for short
# z c: will get you to c drive
# Import-Module ZLocation


# 引入PSWindowsUpdate
Try {
    Import-Module PSWindowsUpdate
}
Catch {
    Install-Module PSWindowsUpdate -Scope CurrentUser -Force  ## PSwindowsUpdates
}

# 引入git-aliases
Try{
    Import-Module git-aliases -DisableNameChecking
}
Catch{
    scoop install git-aliases
}

# 设置 bash style tab completion
Set-PSReadLineKeyHandler -Key Tab -Function Complete


#------------------------------- Import Modules END   -------------------------------


#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# 设置预测文本来源为历史记录
# Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionSource History


# vim binding to powershell, uncoment one or the other
Set-PSReadlineOption -EditMode vi
# Set-PSReadLineOption -EditMode Windows
# Set-PSReadLineOption -EditMode Emacs

# 每次回溯输入历史，光标定位于输入内容末尾
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# 设置 Ctrl+d 为退出 PowerShell
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit

# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

# 设置向下键为前向搜索历史记录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# 设置列表历史选项, F2切换
#set-psreadlineoption -PredictionViewStyle ListView
set-psreadlineoption -PredictionViewStyle InlineView

#-------------------------------  Set Hot-keys END    -------------------------------


#-------------------------------    Functions BEGIN   -------------------------------
# Python 直接执行
# This will use your default python interpreter
$env:PATHEXT += ";.py"

# 更新系统组件
function Update-Packages {
    # update conda packages (avoid conflit)
    Write-Host "Step 1: Update conda " -ForegroundColor White -BackgroundColor Cyan
    conda update --all

<#
    # update pip (comment out this if you use conda)
    Write-Host "Step 2: Update pip" -ForegroundColor White -BackgroundColor Cyan
    # $a = pip list --outdated
    # $num_package = $a.Length - 2
    # for ($i = 0; $i -lt $num_package; $i++) {
    # 	$tmp = ($a[2 + $i].Split(" "))[0]
    # 	pip install -U $tmp
    # }
    pip freeze | % { $_.split('==')[0] } | % { pip install --upgrade $_ }
#>
    # update TeX Live
    $CurrentYear = Get-Date -Format yyyy
    Write-Host "Step 3: Update TeX Live" $CurrentYear -ForegroundColor White -BackgroundColor Cyan
    tlmgr update --self
    tlmgr update --all

    # update Chocolotey
    Write-Host "Step 4: Update Chocolatey" -ForegroundColor White -BackgroundColor Cyan
    choco outdated
    choco upgrade all

    # update Scoop
    Write-Host "Step 5: Update Scoop" -ForegroundColor White -BackgroundColor Cyan
    scoop update
    scoop update --all

    # update winget
    Write-Host "Step 6: Update Winget" -ForegroundColor White -BackgroundColor Cyan
    winget upgrade
    winget upgrade --all


    # update Powershell Modules
    Write-Host "Step 7: Update Powsherll Modules" -ForegroundColor White -BackgroundColor Cyan
    Update-Module -Force

    # update Windows
    Write-Host "Step 8: Update Windows" -ForegroundColor White -BackgroundColor Cyan
    Install-WindowsUpdate -AcceptAll -Install -AutoReboot


    # update Windows
    Write-Host "Step 9: Update (neo)vim" -ForegroundColor White -BackgroundColor Cyan
    nvim +PackerSync +qa!

}


#-------------------------------    Functions END     -------------------------------


#-------------------------------   Set Alias BEGIN    -------------------------------
# 1. 编译函数 make
function MakeThings {
    nmake.exe $args -nologo
}
Set-Alias -Name make -Value MakeThings

# 2. 更新系统 os-update
Set-Alias -Name os-update -Value Update-Packages

# 3. 查看目录 ls & ll
#
# ----------------------------------------------------------------------------

# option-1
# native to powershell

function ListItemName {
    Write-Host("")
 	(Get-ChildItem).Name
    Write-Host("")
}

function ShowAllItems {
    Write-Host("")
 	Get-ChildItem -force
    Write-Host("")
}

# if it's directory then grey, else it's just cyan

Set-Alias -Name ls -Value ListItemName -Option AllScope
Set-Alias -Name ll -Value ShowAllItems -Option AllScope

# ----------------------------------------------------------------------------
# option-2
# below requires you to install lsd to work
<#
function ListItem {
    Write-Host("")
    lsd -a
    Write-Host("")
}

function ListDirectory {
    Write-Host("")
    lsd -la
    Write-Host("")
}

function TreeView {
    Write-Host("")
    lsd --tree
    Write-Host("")
}

Set-Alias -Name ls -Value ListItem -Option AllScope
Set-Alias -Name ll -Value ListDirectory -Option AllScope
Set-Alias -Name tree -Value TreeView -Option AllScope
#>
# ----------------------------------------------------------------------------

Set-Alias -Name g -Value git
Set-Alias -Name grep -Value findstr
Set-Alias -Name py -Value python

# neofetch swag(but with fastfetch)
Set-Alias -Name neofetch -Value fastfetch
Set-Alias -Name ne -Value fastfetch


# auto ls after each cd, not replacing cd, but use cdd
function Set-LocationWithGCI {
    param(
        $path
    )
    if (Test-Path $path) {
        $path = Resolve-Path $path
        Set-Location $path
        Get-ChildItem $path
    }
    else {
        "Could not find path $path"
    }
}
Set-Alias cdd Set-LocationWithGCI -Force

# 4. 打开当前工作目录
function OpenCurrentFolder {
    param
    (
        # 输入要打开的路径
        # 用法示例：open C:\
        # 默认路径：当前工作文件夹
        $Path = '.'
    )
    Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder

# 5. neovim aliases/ change nvim to vim if you use vim

Set-Alias -Name v -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim

# 6. more "aliases"

function exitConsole(){
        exit
    }

Set-Alias -Name :q -Value exitConsole # vim like keybinds
Set-Alias -Name cc -Value clear
Set-Alias -Name redis -Value redis-cli
Set-Alias -Name cat -Value bat -Option AllScope # use bat whenever possible

#-------------------------------    Set Alias END     -------------------------------


#-------------------------------   Set Network BEGIN    -------------------------------
# 1. 获取所有 Network Interface
function Get-AllNic {
    Get-NetAdapter | Sort-Object -Property MacAddress
}
Set-Alias -Name getnic -Value Get-AllNic

# 2. 获取 IPv4 关键路由
function Get-IPv4Routes {
    Get-NetRoute -AddressFamily IPv4 | Where-Object -FilterScript { $_.NextHop -ne '0.0.0.0' }
}
Set-Alias -Name getip -Value Get-IPv4Routes

# 3. 获取 IPv6 关键路由
function Get-IPv6Routes {
    Get-NetRoute -AddressFamily IPv6 | Where-Object -FilterScript { $_.NextHop -ne '::' }
}
Set-Alias -Name getip6 -Value Get-IPv6Routes
#-------------------------------    Set Network END     -------------------------------


#-------------------------------   Set z.lua BEGIN    -------------------------------

# Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell) -join "`n" })

# Invoke-Expression (& { (lua $HOME/scoop/apps/current/z.lua --init powershell) -join "`n" })
# Invoke-Expression (& { (lua $HOME/scoop/apps/1.8.15/z.lua --init powershell) -join "`n" })

#-------------------------------    Set z.lua END     -------------------------------

#-------------------------------   Set zoxide BEGIN    -------------------------------

# For zoxide v0.8.0+
Try {
    Invoke-Expression (& {
            $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
        })
}
Catch {
    scoop install zoxide
}

#-------------------------------    Set zoxide END     -------------------------------





#-------------------------------   Set clash BEGIN    -------------------------------


<#
 #.Synopsis
 #This function will set the proxy settings provided as input to the cmdlet.
 #.Description
 #This function will set the proxy server and (optional) Automatic configuration script.
 #.Parameter Proxy Server
 #This parameter is set as the proxy for the system.
 #Data from. This parameter is Mandatory.
 #.Example
 #Setting proxy information.
 #Set-NetProxy -proxy "proxy:7890"
 #.Example
 #Setting proxy information and (optional) Automatic Configuration Script.
 #Set-NetProxy -proxy "proxy:7890" -acs "http://proxy Jump :7892"
#>


function Set-NetProxy {
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory = $True, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [String[]]$Proxy,

        [Parameter(Mandatory = $False, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [AllowEmptyString()]
        [String[]]$acs

    )

    Begin {

        $regKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

    }

    Process {

        Set-ItemProperty -path $regKey ProxyEnable -value 1

        Set-ItemProperty -path $regKey ProxyServer -value $proxy

        if ($acs) {

            Set-ItemProperty -path $regKey AutoConfigURL -Value $acs
        }

    }

    End {

        Write-Output "Proxy is now enabled"

        Write-Output "Proxy Server : $proxy"

        if ($acs) {

            Write-Output "Automatic Configuration Script : $acs"

        }
        else {

            Write-Output "Automatic Configuration Script : Not Defined"

        }
    }
}


function Disable-NetProxy {
    Begin {

        $regKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

    }

    Process {

        Set-ItemProperty -path $regKey ProxyEnable -value 0 -ErrorAction Stop

        Set-ItemProperty -path $regKey ProxyServer -value "" -ErrorAction Stop

        Set-ItemProperty -path $regKey AutoConfigURL -Value "" -ErrorAction Stop

    }

    End {

        Write-Output "Proxy is now Disabled"


    }

}


# more advanced functions based on the functions above


function Cfw {
    # open "$HOME\scoop\apps\clash-for-windows\current\Clash for Windows.exe"
    # & "$HOME\scoop\apps\clash-for-windows\current\Clash for Windows.exe"
    & "$HOME\scoop\apps\clash-verge\current\Clash Verge.exe"
    Set-NetProxy -proxy "127.0.0.1:7890"
    Start-Sleep 2
    git config --global http.proxy 'http://127.0.0.1:7890'
    git config --global https.proxy 'http://127.0.0.1:7890'
    echo "git proxy set"
    git config --global --get http.proxy
    start "https://www.youtube.com"
    start "https://www.google.com"
    start "https://web.telegram.org/z/"
    cp ~/pip/pip.ini.old ~/pip/pip.ini
}


function Disable-Cfw {
    # $ClashApp = "Clash for Windows"
    $ClashApp = "Clash Verge"

    Disable-NetProxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    rm ~/pip/pip.ini

    if ((get-process $ClashApp -ea SilentlyContinue) -eq $Null) {
        Write-Host "Not Running"
    }

    else {
        Write-Host "$ClashApp is Running"
        Stop-Process -processname $ClashApp
        Write-Host "$ClashApp has been closed"
        git config --global --unset http.proxy
        git config --global --unset https.proxy
        Write-Host "git proxy unset"
    }
}

function Reboot {
    Disable-Cfw
    shutdown -r -t 0
}

function PowerOff {
    Disable-Cfw
    shutdown -p
}


# npm i -g empty-trash

function emptytrash{
        empty-trash.cmd
        # you need to --> "npm i -g empty-trash-cli"
        Write-Host "Yay, everything is shiny now!"
        duf
    }


# Clear-Host
# set PowerShell to UTF-8
# [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding


# PSReadLine
Set-PSReadLineOption -BellStyle None
# Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Fzf
# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"


# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
# -------------------------------   Set clash END    -------------------------------



# -------------------------------   Set fnm START    -------------------------------

fnm env --use-on-cd | Out-String | Invoke-Expression

# -------------------------------   Set fnm END    -------------------------------


# -------------------------------   Set Komorebi END    -------------------------------

# $Env:KOMOREBI_CONFIG_HOME = '$env:userprofile\.config\komorebi'
$Env:KOMOREBI_CONFIG_HOME = '$HOME\.config\komorebi'

# -------------------------------   Set Komorebi END    -------------------------------

# -------------------------------   Set lunarvim START    -------------------------------

# auto setup lunarvim
# Set-Alias lvim C:\Users\mino29\.local\bin\lvim.ps1

$lvimPath = "$HOME\.local\bin\lvim.ps1"
if (Test-Path -Path $lvimPath)
{
    Set-Alias lvim $lvimPath
    Set-Alias lv $lvimPath
    # Set-Alias v $lvimPath
    # Set-Alias vi $lvimPath
    # Set-Alias vim $lvimPath
}
else {Invoke-WebRequest https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.ps1 -UseBasicParsing | Invoke-Expression}
# -------------------------------   Set lunarvim END    -------------------------------


function potplayer {
    param
    (
        # 输入要打开的路径
        # 用法示例：open C:\
        # 默认路径：当前工作文件夹
        $Path = (Get-Location).Path
    )
    & "$HOME\scoop\apps\potplayer\current\PotPlayer64.exe" $Path
}
Set-Alias -Name pot -Value potplayer
Set-Alias -Name play -Value potplayer


function jpegview {
    param
    (
        # 输入要打开的路径
        # 用法示例：open C:\
        # 默认路径：当前工作文件夹
        $Path = (Get-Location).Path
    )
    & "$HOME\scoop\apps\jpegview\current\JPEGView.exe" $Path
}
Set-Alias -Name feh -Value jpegview


function rmrf {
     <#
        .DESCRIPTION
        Deletes the specified file or directory.
        .PARAMETER target
        Target file or directory to be deleted.
        .NOTES
        This is an equivalent command of "rm -rf" in Unix-like systems.
        #>
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Target
    )
    Remove-Item -Recurse -Force $Target
}

function flatten {

     <#
        .DESCRIPTION
        Move all files in the subfolder(s) into parent folder
        Deletes the specified file or directory.
        .PARAMETER target
        Target Directory to be flattened
        .NOTES
        THis currently overwrites and deletes files with the same name
        #>
    Param(
        [Parameter(Mandatory=$false)]
        [string]$Target = (Get-Location).Path
        )
    $exclude_ext = @(".mp4", ".mkv", ".srt", ".ts", ".wmv", ".avi", ".zip", ".rar", ".idx", ".sub")
    $img_ext = @(".png", ".jpg", ".jpge", ".webp", ".gif", ".svg")
    $video_ext = @(".mp4", ".mkv", ".srt", ".ts", ".wmv", ".avi", ".idx", ".sub")
    $doc_ext = @(".pdf", ".zip", ".rar", ".docx")
    Get-ChildItem -Path $Target -Recurse -File | Move-Item -Destination $Target -Force
    #Get-ChildItem -Path $Target -Recurse -Exclude *.mp4, *.mkv | Remove-Item -Force
    Get-ChildItem -Path $Target -Recurse | Where-Object { $exclude_ext -notcontains $_.Extension } | Remove-Item -Recurse -Force
    Get-ChildItem -Path $Target -Recurse | foreach {
       if( $_.psiscontainer -eq $true){
          if((gci $_.FullName) -eq $null){
             Write-Output "Removing Empty folder $($_.FullName)"
             $_.FullName | Remove-Item -Recurse -Force
          }
        }
       if($_.Length -eq 0){
          Write-Output "Removing Empty File $($_.FullName)"
          $_.FullName | Remove-Item -Force
       }
    #This delete all files less than 120MB
    gci | ?{$_.Extension -in ".ts", ".mp4", ".flv", ".avi"} | ?{$_.Length -lt 120MB} | rm
    # Get-ChildItem -Path $Target -Recurse | Where-Object { $_.Extension -in $video_ext } 
       <#
       .NOTES
       This delete all files less than 70MB
       if($_.Length -lt 70000000){
          Write-Output "Removing small File $($_.FullName)"
          $_.FullName | Remove-Item -Force
       }
       #>
    }
    # delete files except for the included extensions
    # Get-ChildItem -Path $Target -Recurse | Where-Object { $exclude_ext -notcontains $_.Extension } | Remove-Item -Recurse -Force
    # Get-ChildItem -Path $Target -Recurse -Exclude *.mp4, *.mkv | Remove-Item -Force
}

<#
-filter
 image leave only images files
 video leave only video files

#>

# ultimate flatten
<#
flatten a directory (files with duplicate names be renamed with number suffix)
delete empty folders
delete empty files
sort files according to their extensions 
categories: Video, Pictures, Documents, Audio and Others
#>
function rename {
    param
    (
        # 输入要打开的路径
        # 用法示例：rename C:\
        # 默认路径：当前工作文件夹
        $Path = '.'
    )
    & "$HOME\scoop\apps\advancedrenamer\current\ARen.exe" $Path
}
Set-Alias -Name rn -Value rename


function cleanTorrentTrash {
    param
    (
        # 输入要打开的路径
        # 用法示例： cleanTorrentTrash C:\
        # 默认路径：当前工作文件夹
        $Path = '.'
    )
    Get-ChildItem -Path $Path -Include *.torrent, *.aria2  -File -Recurse | Remove-Item -Force
}


# The End Goal of this profile
# Make it feature-rich
# Make it run blazingly fast

function Get-Temperature {
    $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"

    $currentTempKelvin = $t.CurrentTemperature / 10
    $currentTempCelsius = $currentTempKelvin - 273.15

    $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32

    return $currentTempCelsius.ToString() + " C : " + $currentTempFahrenheit.ToString() + " F : " + $currentTempKelvin + "K"  
}

# Save in your c:\users\yourName\Documents\WindowsPowerShell\modules\ directory
# in sub directory get-temperature as get-temperature.psm1
# You **must** run as Administrator.
# It will only work if your system & BIOS support it. If it doesn't work, I can't help you.

# Just type get-temperature in PowerShell and it will spit back the temp in Celsius, Farenheit and Kelvin.

Set-Alias lvim 'C:\Users\Wednesday\.local\bin\lvim.ps1'
