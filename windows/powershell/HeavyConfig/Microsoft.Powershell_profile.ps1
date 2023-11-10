#------------------------------- Notes ----------------------------------------

<#
 * FileName: Microsoft.PowerShell_profile.ps1
 * Author: Wu Zhongzheng
 * Email: zhongzheng.wu@outlook.com
 * Date: 2022, Sep. 9
 * Copyright: No copyright. You can use this code for anything with no warranty.
#>

# Check if Winget is installed
if (!(Get-Command -Name winget -ErrorAction SilentlyContinue)) {
    # Check internet connection
    $connected = Test-NetConnection -ComputerName 8.8.8.8 -InformationLevel Quiet

    # Install Winget if connected
    if ($connected) {
        Write-Host "Winget is not installed on your system."
        iex "& {$(irm -useb 'https://aka.ms/getwinget')}"
    }
}

# scoop setup, a minimal setup
function Setup-Scoop {
    # Enable LongPaths support
    sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

    # Install Scoop if not already installed
    iex "& {$(iwr -useb scoop.201704.xyz)} -RunAsAdmin"

    # Add main bucket
    scoop bucket add main

    # Install essential programs using Scoop
    scoop install 7zip git vim dark aria2 innounp lessmsi # Define the list of software to install

    $startSoftwareList = @(
        '7zip',
        'git',
        'aria2',
        'dark',
        'innounp'
        'lessmi'
        'winget'
        # Add more software names here...
    )

    # Install software using Scoop
    foreach ($software in $startSoftwareList) {
        scoop install $software
    }

    # aria2
    scoop config aria2--enabled true
    scoop config aria2-warning-enabled false

    # must-have buckets
    scoop bucket add main
    scoop bucket add apps "https://github.com/kkzzhizhou/scoop-apps"
    scoop bucket add im-select "https://github.com/daipeihust/im-select"

    $fullSoftwareList = @(
        'scoop-search-multisource'
        'im-select'
        'oh-my-posh'
        'posh-git'
        'sumatrapdf'
        'jpegview'
        'potplayer'
        'geekuninstaller'
        # Add more software names here...
    )

    foreach ($software in $fullSoftwareList) {
        scoop install $software
    }

    Write-Host "Scoop setup completed!"
}



#------------------------------- Scoop settings -------------------------


# Check if scoop-search-multisource is installed
if (!(Get-Command -Name scoop-search-multisource -ErrorAction SilentlyContinue)) {
    # Check internet connection
    $connected = Test-NetConnection -ComputerName 8.8.8.8 -InformationLevel Quiet

    # Install Winget if connected
    if ($connected) {
        Write-Host "scoop-search-multisource is not installed on your system."
        scoop install scoop-search-multisource
        iex "& {$(irm -useb 'https://aka.ms/getwinget')}"
    }
}

# Speedier scoop search
Invoke-Expression (&scoop-search-multisource.exe --hook)
# Invoke-Expression (&scoop-search --hook)


#------------------------------- Setting to run R term -------------------------

# to run rterm with just 'r', otherwise it would just run the last command
#rm alias:\r


#------------------------------- Import Modules BEGIN -------------------------


# 引入 oh-my-posh
# 设置 PowerShell 主题
# mydesktop--> MARCY (bigger screen, better with pwsh10k_norse)
# mylaptop--> HILDA (smaller screen, better with polarnord)
# others--> (use pwsh10k_norse by default)

$hostname = hostname
Try {
    # oh-my-posh init pwsh --config "$home\.dotfiles\windows\oh-my-posh\themes\minimal.omp.json" | Invoke-Expression
    oh-my-posh init pwsh --config "$home\.dotfiles\windows\oh-my-posh\themes\tokyonight_storm.omp.json" | Invoke-Expression
    # oh-my-posh init pwsh --config '$env:POSH_THEMES_PATH\tokyonight_storm.omp.json' | Invoke-Expression
    # oh-my-posh init pwsh --config '$env:POSH_THEMES_PATH\zash.omp.json' | Invoke-Expression
}
Catch {
    # winget install JanDeDobbeleer.OhMyPosh
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
    Install-Module PSReadLine -Scope CurrentUser -Force  ## posh-git git美化管理包
}

# 引入terminal-icons
Try {
    Import-Module -Name Terminal-Icons
}
Catch {
    Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force # oh-my-posh 基础美化工具包
}


# 引入git-aliases
Try{
    Import-Module git-aliases -DisableNameChecking
}
Catch{
    scoop install git-aliases
}



#------------------------------- Import Modules END   -------------------------------


#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# 设置预测文本来源为历史记录
# Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionSource History

# 设置列表历史选项, F2切换
set-psreadlineoption -PredictionViewStyle InlineView
#set-psreadlineoption -PredictionViewStyle ListView

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

# 设置 bash style tab completion
# Set-PSReadLineKeyHandler -Key Tab -Function Complete

# Autopair (might be a bit slow)
Set-PSReadLineKeyHandler -Chord '"',"'" `
                         -BriefDescription SmartInsertQuote `
                         -LongDescription "Insert paired quotes if not already on a quote" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($line.Length -gt $cursor -and $line[$cursor] -eq $key.KeyChar) {
        # Just move the cursor
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
    }
    else {
        # Insert matching quotes, move cursor to be in between the quotes
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
    }
}
#-------------------------------  Set Hot-keys END    -------------------------------


#-------------------------------    Functions BEGIN   -------------------------------
# Python 直接执行
# This will use your default python interpreter
$env:PATHEXT += ";.py"

# 更新系统组件
function Update-Packages {
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
    $wins = New-Object -ComObject  Shell.Application
    $wins.MinimizeAll()
    Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder

# 5. neovim aliases/ change nvim to vim if you use vim

Set-Alias -Name v -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim

# 6. vscodium aliases/ comment out this part if you use code
# Set-Alias -Name code -Value codium

# 7. more "aliases"

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


# more advanced functions based on the functions above

function Reboot {
    #Disable-Cfw
    shutdown -r -t 0
}

function PowerOff {
    #Disable-Cfw
    shutdown -p
}


# PSReadLine
Set-PSReadLineOption -BellStyle None
# Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Fzf
# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# -------------------------------   Set clash END    -------------------------------



# -------------------------------   Set fnm START    -------------------------------

fnm env --use-on-cd | Out-String | Invoke-Expression

# -------------------------------   Set fnm END    -------------------------------


# -------------------------------   Set Komorebi END    -------------------------------

# $Env:KOMOREBI_CONFIG_HOME = '$env:userprofile\.config\komorebi'
$Env:KOMOREBI_CONFIG_HOME = '$env:userprofile\.config\komorebi'

# -------------------------------   Set Komorebi END    -------------------------------


function potplayer {
    param
    (
        # 输入要打开的路径
        # 用法示例：open C:\
        # 默认路径：当前工作文件夹
        $Path = (Get-Location).Path
    )
    # Minimize all windows
    $wins = New-Object -ComObject  Shell.Application
    $wins.MinimizeAll()
    # Open video files using potplayer
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
    $wins = New-Object -ComObject  Shell.Application
    $wins.MinimizeAll()
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
    Param
    (
        [Parameter(Mandatory=$false)]
        [string]$Target = (Get-Location).Path,
        [Parameter(Mandatory=$true)]
        [string]$Filter
    )

    $exclude_ext = @(".mp4", ".mkv", ".srt", ".ts", ".wmv", ".avi", ".idx", ".sub", ".ass")
    $img_ext = @(".png", ".jpg", ".jpge", ".webp", ".gif", ".svg", ".psd", ".xcf")
    $video_ext = @(".mp4", ".mkv", ".srt", ".ts", ".wmv", ".avi", ".idx", ".sub", ".ass")
    $doc_ext = @(".pdf", ".zip", ".rar", ".docx", ".epub", ".mobi", ".cbr", ".cbz", ".azw3")
    $audio_ext = @(".mp3", ".m4a", ".flac")
    $app_ext = @(".exe", ".msi", ".iso")

    if ($Filter -eq "Image")
    {
    $opt_ext = $img_ext
    }
    elseif ($Filter -eq "Video")
    {
    $opt_ext = $video_ext
    }
    elseif ($Filter -eq "Document")
    {
    $opt_ext = $doc_ext
    }
    elseif ($Filter -eq "Audio")
    {
    $opt_ext = $audio_ext
    }
    elseif ($Filter -eq "App")
    {
    $opt_ext = $app_ext
    }
    else
    {
    break
    }

    Get-ChildItem -Path $Target -Recurse -File | Move-Item -Destination $Target -Force
    #This move each file to the top parent folder
    Get-ChildItem -Path $Target -Recurse | Where-Object { $opt_ext -notcontains $_.Extension } | Remove-Item -Recurse -Force
    #This delete all empty files and folders
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
    #This delete all video files less than 200MB
    #gci | ?{$_.Extension -in $video_ext} | ?{$_.Length -lt 200MB} | rm
    #gci | ?{$_.Extension -in $video_ext} | ?{$_.Length -lt 250MB} | rm
       <#
       .NOTES
       This delete all files less than 70MB
       if($_.Length -lt 70000000){
          Write-Output "Removing small File $($_.FullName)"
          $_.FullName | Remove-Item -Force
       }
       #>
    }
}

function rename {
    param
    (
        # 输入要打开的路径
        # 用法示例：rename C:\
        # 默认路径：当前工作文件夹
        $Path = '.'
    )
    $wins = New-Object -ComObject  Shell.Application
    $wins.MinimizeAll()
    & "$HOME\scoop\apps\advancedrenamer\current\ARen.exe" $Path
}
Set-Alias -Name rn -Value rename
