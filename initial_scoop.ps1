Set-ExecutionPolicy RemoteSigned

# Command to create a PowerShell profile
New-Item -path $profile -type file -force

# Install windows terminal
winget install microsoft.windowsterminal

# 执行安装命令
iwr -useb scoop.201704.xyz | iex
iwr -useb https://gitee.com/RubyKids/scoop-cn/raw/master/install.ps1 | iex

# 更换scoop的repo地址
# scoop config SCOOP_REPO 'https://github.com/lukesampson/scoop'
scoop config SCOOP_REPO 'https://gitee.com/glsnames/scoop-installer'
# scoop config SCOOP_REPO 'https://gitee.com/squallliu/scoop'
# scoop config SCOOP_REPO 'https://github.com/Ash258/Scoop-Core'
# scoop config SCOOP_REPO 'https://github.com/ScoopInstaller/Scoop'

# 拉取新库地址
scoop update

# must-have apps
scoop install git aria2 dark scoop-search scoop-completion

# aria2
scoop config aria2--enabled true
scoop config aria2-warning-enabled false

# must-have buckets
scoop bucket add main
scoop bucket add apps "https://github.com/kkzzhizhou/scoop-apps"
scoop bucket add im-select "https://github.com/daipeihust/im-select"

scoop bucket add extras
scoop bucket add versions
scoop bucket add nightlies
scoop bucket add nirsoft
scoop bucket add php
scoop bucket add nerd-fonts
scoop bucket add nonportable
scoop bucket add java
scoop bucket add games
scoop bucket add jetbrains

scoop bucket add scoopet "https://github.com/ivaquero/scoopet.git"
scoop bucket add portablesoft 'https://github.com/shenbo/portablesoft'

scoop bucket list
