
#------------------------------- Startup settings BEGIN -----------------------

# Remove those annoying startup powershell info when possible
Clear-Host

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

#-------------------------------   Set starship BEGIN    -------------------------------

<#
$ENV:STARSHIP_CONFIG = "$HOME\.dotfiles\common\.starship\starship.toml"
# $ENV:STARSHIP_DISTRO = " 者 x 💀 "
Invoke-Expression (&starship init powershell)
#>

#-------------------------------   Set starship END    -------------------------------

#------------------------------- Import Modules BEGIN -------------------------


# 引入 oh-my-posh
# 设置 PowerShell 主题

Try {
    # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\peru.omp.json" | Invoke-Expression
    oh-my-posh init pwsh --config "$home\.dotfiles\windows\oh-my-posh\themes\nord.omp.json" | Invoke-Expression
}
Catch {
    scoop install oh-my-posh
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

# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# 设置列表历史选项, F2切换
set-psreadlineoption -PredictionViewStyle ListView
# set-psreadlineoption -PredictionViewStyle InlineView

#-------------------------------  Set Hot-keys END    -------------------------------





#-------------------------------    Functions BEGIN   -------------------------------
# Python 直接执行
# This will use you default python interpreter
$env:PATHEXT += ";.py"

# 更新系统组件
function Update-Packages {
    # update conda packages (avoid conflit)
    Write-Host "Step 1: Update conda " -ForegroundColor White -BackgroundColor Cyan
    conda update --all
    
    # update pip (comment out this if you use conda)
    Write-Host "Step 2: Update pip" -ForegroundColor White -BackgroundColor Cyan
    # $a = pip list --outdated
    # $num_package = $a.Length - 2
    # for ($i = 0; $i -lt $num_package; $i++) {
    # 	$tmp = ($a[2 + $i].Split(" "))[0]
    # 	pip install -U $tmp
    # }
    pip freeze | % { $_.split('==')[0] } | % { pip install --upgrade $_ }

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
    nvim +PlugUpdate +qa!
    nvim +CocUpdate +qa!

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
# old ones
#
# function ListDirectory {
#     Write-Host("")
# 	(Get-ChildItem).Name
# 	Write-Host("")
# }

# Set-Alias -Name ls -Value ListDirectory -Option AllScope
# Set-Alias -Name ll -Value Get-ChildItem -Option AllScope

# experimental
# below requires you to downloads lsd to work
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

Set-Alias -Name ls -Value ListItem -Option AllScope
Set-Alias -Name ll -Value ListDirectory -Option AllScope
Set-Alias -Name g -Value git
Set-Alias -Name grep -Value findstr
Set-Alias -Name py -Value python

Set-Alias -Name neofetch -Value winfetch
Set-Alias -Name ne -Value winfetch

Set-Alias -Name btop -Value btop4win

# Set-Alias -Name ls -Value "lsd -a" -Option AllScope
# Set-Alias -Name ll -Value 'lsd -la' -Option AllScope

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
# Set-Alias -Name ":q" -Value "exit"
Set-Alias -Name cc -Value clear
Set-Alias -Name redis -Value redis-cli
Set-Alias -Name cat -Value bat -Option AllScope

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





#-------------------------------   Set test BEGIN    -------------------------------


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
# -------------------------------   Set test END    -------------------------------

# winfetch
