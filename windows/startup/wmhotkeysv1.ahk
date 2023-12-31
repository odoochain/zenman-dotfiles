;----------------------------- autohotkey documentations ----------------------

; The script is written with ahk v1
; https://www.autohotkey.com/docs/v1/

; The script to be re-writtern with ahk v2
; https://www.autohotkey.com/docs/v2/

;----------------------------- autoreload the script  -------------------------

SetTimer,UPDATEDSCRIPT,1000
UPDATEDSCRIPT:
	FileGetAttrib,attribs,%A_ScriptFullPath%
	IfInString,attribs,A
	{
		FileSetAttrib,-A,%A_ScriptFullPath%
		Reload
	}
return

;-------------------------------- global variables  ---------------------------

;global vimpath := "C:\Users\" . A_UserName . "\scoop\apps\git\current\usr\bin\vim.exe"

;--------------------------------- Edit the script  ---------------------------

#y::
;run, wt.exe "nvim.exe" %A_ScriptFullPath%
; vimpath := "C:\Users\" . A_UserName . "\scoop\apps\git\current\usr\bin\vim.exe"
vimpath := "C:\Users\" . A_UserName . "\scoop\apps\git\current\usr\bin\vim.exe"
run, wt.exe %vimpath% %A_ScriptFullPath%
Return

;------------------------------- universal hotkeys  ---------------------------

; Volume Controls
; Toggle the master mute (set it to the opposite state)

;<#z::SoundSet, +1, , mute  ; silent w/o prompt
<#z::Send {Volume_mute} ; with gui prompt

toggleDropPoint()
{
if WinExist("ahk_exe DropPoint.exe")
{
WinActivateBottom, ahk_exe DropPoint.exe
}
Else
{
Run droppoint.exe, , hide
}
Return
}

; window utils

; Force quit app or shutdown pc (when all windows minimized)
quitWindowOrShutDown()
{
if WinActive("ahk_class WorkerW")
    {
    WinActivate, ahk_class Shell_TrayWnd
    WinClose, A
    }
; Keep a terminal around
else if WinActive("ahk_exe WindowsTerminal.exe")
    {
    WinMinimize, A
    }
Else
    {
    WinClose, A
    }
Return
}

<#q::
quitWindowOrShutDown()
return


; Close current window
<#w::send ^w ; as in ctrl+w to close tab


; Manage windows, maximize current window

<#f::
WinGet,S,MinMax,A
if S=0
    WinMaximize,A
else if S=1
    WinRestore,A
else if S=-1
    WinRestore,A
return


; 启动或切换到下载目录
launchOrSwitchDownloads()
{
if WinExist("ahk_class CabinetWClass")
{
WinActivateBottom, ahk_class CabinetWClass
}
Else
{
Run shell:::{374DE290-123F-4565-9164-39C4925E467B}
}
Return
}

; win+e
#e::
launchOrSwitchDownloads()
Return

/*
; 启动或切换到playnite
launchOrSwitchPlaynite()
{
if WinExist("ahk_exe Playnite.DesktopApp.exe")
{
    ;if WinActive("ahk_exe Playnite.DesktopApp.exe")
    ;{WinMinimize, ahk_exe Playnite.DesktopApp.exe}
    ;else
    ;{ WinActivateBottom, ahk_exe Playnite.DesktopApp.exe }
    WinActivateBottom, ahk_exe Playnite.DesktopApp.exe
}
Else
{
Run "C:\Users\%A_UserName%\scoop\apps\playnite\current\Playnite.DesktopApp.exe" "--hidesplashscreen"
}
Return
}

; win+g
#g::
launchOrSwitchPlaynite()
Return
*/

;窗口最小化

elegantMinimizeWindow()
{
if WinActive("ahk_class Progman")
{
WinActivate, ahk_class Shell_TrayWnd
WinMinimize, A
}
Else
{
WinMinimize, A
}
Return
}

#m::
elegantMinimizeWindow()
Return

#c:: ;mouse pick color value(RGB/CSS)
MouseGetPos, mouseX, mouseY
PixelGetColor, color, %mouseX%, %mouseY%,RGB
StringRight color,color,6
clipboard = %color%
return

^+d:: FileRecycleEmpty ; 清空回收站
;^+d::
;Run ::{645ff040-5081-101b-9f08-00aa002f954e}  ; Opens the Recycle Bin.

;------------------------ Frequently-Used Programs  ---------------------------

; Quicknotes with (neo)vim

; 启动或切换招商证券
launchOrSwitchQuicknotes()
{
If WinExist("^Hilda ahk_exe WindowsTerminal.exe")
{
    WinActivate, ahk_exe WindowsTerminal.exe
}
Else
{
    vimpath := "C:\Users\" . A_UserName . "\scoop\apps\git\current\usr\bin\vim.exe"
    run, wt.exe %vimpath% "C:\Users\%A_UserName%\Downloads\Quicknotes\Raw\%A_YYYY%-%A_MM%-%A_DD%_quicknotes.md"
}
Return
}


#n::
;run, wt.exe "nvim.exe" "C:\Users\%A_UserName%\Downloads\Quicknotes\Raw\%A_YYYY%-%A_MM%-%A_DD%_quicknotes.md"
;vimpath := "C:\Users\" . A_UserName . "\scoop\apps\git\current\usr\bin\vim.exe"
;run, wt.exe %vimpath% "C:\Users\%A_UserName%\Downloads\Quicknotes\Raw\%A_YYYY%-%A_MM%-%A_DD%_quicknotes.md"
launchOrSwitchQuicknotes()
Return

; 启动或切换招商证券
launchOrSwitchTdxW()
{
if WinExist("ahk_class TdxW_MainFrame_Class")
{
WinActivateBottom, ahk_class TdxW_MainFrame_Class
}
Else
{
Sleep 1000
Run "C:\Program Files (x86)\zd_zsone\TdxW.exe"
;Run "C:\new_tdx\tdxw.exe"
}
Return
}

; win+k
#k::launchOrSwitchTdxW()
Return


; 启动或切换Qalc
launchOrSwitchQalc()
{
if WinExist("ahk_exe qalculate-gtk.exe")
{
WinActivateBottom, ahk_exe qalculate-gtk.exe
}
Else
{
Run "C:\Users\%A_UserName%\scoop\apps\qalculate\current\qalculate.exe"
}
Return
}

; win+j
#j::launchOrSwitchQalc()
Return


; 启动或切换sumatrapdf
launchOrSwitchSumatra()
{
if WinExist("ahk_exe SumatraPDF.exe")
{
WinMinimizeAll
WinActivateBottom, ahk_exe SumatraPDF.exe
}
Else
{
WinMinimizeAll
Run "C:\Users\%A_UserName%\scoop\apps\sumatrapdf\current\sumatrapdf"
}
Return
}

; win+g
#g::launchOrSwitchSumatra()
Return



; 启动或切换Dict
launchOrSwitchDict()
{
if WinExist("ahk_exe GoldenDict.exe")
{
WinActivateBottom, ahk_exe GoldenDict.exe
}
Else
{
Run "C:\Users\%A_Username%\scoop\apps\goldendict\current\GoldenDict.exe"
}
Return
}

; win+u
#u::launchOrSwitchDict()
Return

; win+h
#h::
WinMinimize, A
Return

; win+i  to open sound mixer setting
#i::
;Run ms-settings:apps-volume
Run ms-settings:bluetooth
return


; 启动或切换Task Manager
launchTaskManager()
{
if WinExist("ahk_exe Taskmgr.exe")
{
WinActivateBottom, ahk_exe Taskmgr.exe
WinWait, Task Manager
WinMaximize
}
Else
{
run taskmgr.exe
}
return
}

#x::launchTaskManager()
Return


; 启动或切换AriaNgGui
launchOrSwitchAriaNgGui()
/*
; 用Edge
{
WinMinimizeAll
SetTitleMatchMode RegEx
if WinExist("^Download ahk_exe msedge.exe")
{
WinActivate
}
Else
{
;Run, msedge.exe "chrome-extension://jjfgljkjddpcpfapejfkelkbjbehagbh/ui/ariang/index.html#!/downloading" " --new-window"
Run, msedge.exe "extension://jjfgljkjddpcpfapejfkelkbjbehagbh/ui/ariang/index.html#!/downloading" " --new-window"
}
Return
}
*/

; 用Chrome
/*
{
WinMinimizeAll
SetTitleMatchMode RegEx
if WinExist("^Download ahk_exe chrome.exe")
{
WinActivate
}
Else
{
Run, chrome.exe, ,hide "chrome-extension://mpkodccbngfoacfalldjimigbofkhgjn/ui/ariang/index.html#!/downloading" " --new-window"
; Run, "C:\Users\%A_Username%\scoop\apps\googlechrome\current\chrome.exe" "chrome-extension://mpkodccbngfoacfalldjimigbofkhgjn/ui/ariang/index.html#!/downloading" " --new-window"
; Run, "C:\Users\%A_Username%\scoop\apps\ungoogled-chromium\current\chrome.exe" "chrome-extension://mpkodccbngfoacfalldjimigbofkhgjn/ui/ariang/index.html#!/downloading" " --new-window"
;Run, "C:\Users\%A_Username%\AppData\Local\Chromium\Application\chrome.exe" "chrome-extension://mpkodccbngfoacfalldjimigbofkhgjn/ui/ariang/index.html#!/downloading" " --new-window"
}
Return
}
*/

; 用Firefox
{
WinMinimizeAll
SetTitleMatchMode RegEx
if WinExist("^Download ahk_exe firefox.exe")
{
WinActivate
}
Else
{
;Run, firefox.exe "moz-extension://227fd6b9-9233-48e3-8bcd-48795038e85f/ui/ariang/index.html#!/downloading" "--new-window"
;Run "C:\Users\%A_Username%\scoop\apps\firefox\current\firefox.exe" "moz-extension://227fd6b9-9233-48e3-8bcd-48795038e85f/ui/ariang/index.html#!/downloading" "--new-window"
Run, "C:\Users\%A_Username%\scoop\apps\firefox-nightly\current\firefox.exe" "moz-extension://4aa281a0-6e35-4121-8b0a-72936e5e19b1/ui/ariang/index.html#!/downloading"
}
Return
}

/*
{
if WinExist("ahk_exe Motrix.exe")
{
WinActivateBottom, ahk_exe Motrix.exe
}
Else
{
Run "C:\Users\%A_Username%\scoop\apps\motrix\current\motrix.exe"
}
Return
}
*/

; win+o
#o::launchOrSwitchAriaNgGui()
Return


; 启动或切换WindowsTerminal
;launchOrSwitchToWt()
;{
;if WinExist("ahk_exe WindowsTerminal.exe")
;{
;WinMinimizeAll
;WinActivateBottom, ahk_exe WindowsTerminal.exe
;}
;Else
;{
;WinMinimizeAll
;Run, wt.exe
;}
;Return
;}
;
;<#Enter::
;launchOrSwitchToWt()
;return

;<#Enter::
;Run, wt.exe
;return

<#Enter::
    If WinExist("ahk_exe WindowsTerminal.exe")
    {
        WinActivate, ahk_exe WindowsTerminal.exe
    }
    Else
    {
        Run, wt.exe
    }
return



;-----------------------google chrome---------------------------
;启动或切换Chrome
;launchOrSwitchToChrome()
;{
;if WinExist("ahk_exe chrome.exe")
;{
;WinActivateBottom, ahk_exe chrome.exe
;}
;Else
;{
;Run, chrome.exe, , hide
;Run, "C:\Users\%A_Username%\scoop\apps\ungoogled-chromium\current\chrome.exe"
;Run, "C:\Users\%A_Username%\scoop\apps\googlechrome\current\chrome.exe"
;Run, "C:\Users\%A_Username%\AppData\Local\Chromium\Application\chrome.exe"
;Run, chrome.exe, --user-data-dir="C:\Users\%A_Username%\scoop\apps\googlechrome\current\User Data", hide
;Run, C:\Users\%A_Username%\scoop\apps\googlechrome\current\chrome.exe --user-data-dir="C:\Users\%A_Username%\scoop\apps\googlechrome\current\User Data"
;}
;Return
;}
;
;<#b::
;launchOrSwitchToChrome()
;Return

;----------------------- microsoft edge ---------------------------
/*
;启动或切换Edge
launchOrSwitchToEdge()
{
if WinExist("ahk_exe msedge.exe")
{
WinActivateBottom, ahk_exe msedge.exe
}
Else
{
 Run, msedge
}
Return
}

<#b::
launchOrSwitchToEdge()
Return
*/
;----------------------- Mozilla Firefox ---------------------------
;启动或切换Firefox


launchOrSwitchToFirefox()
{
if WinExist("ahk_exe firefox.exe")
{
WinActivateBottom, ahk_exe firefox.exe
}
Else
{
; Run, firefox.exe, , hide
 ;Run "C:\Users\%A_Username%\scoop\apps\firefox\current\firefox.exe"
 Run "C:\Users\%A_Username%\scoop\apps\firefox-nightly\current\firefox.exe"
}
Return
}

<#b::
launchOrSwitchToFirefox()
Return


;----------------- world wide web (work in progress)---------------------------
/*
launchOrSwitchToClash()
{
if WinExist("ahk_exe ClashWeb.exe")
{
launchOrSwitchToEdge()
}
Else
{
 Run "C:\Users\%A_Username%\scoop\apps\clashweb\current\ClashWeb.exe"
}
Return
}

<#b::
launchOrSwitchToClash()
Return
*/

/*
;启动或切换Spotify
launchOrSwitchToSpotify()
{
if WinExist("ahk_exe Spotify.exe")
{
WinActivateBottom, ahk_exe Spotify.exe
}
Else
{
 Run "C:\Users\%A_Username%\scoop\apps\spotify\current\Spotify.exe"
}
Return
}

<#t::
launchOrSwitchToSpotify()
Return
*/

;启动或切换listen1
launchOrSwitchToListen1()
{
if WinExist("ahk_exe Listen1.exe")
{
WinActivateBottom, ahk_exe Listen1.exe
}
Else
{
 Run "C:\Users\%A_Username%\scoop\apps\listen1desktop\current\Listen1.exe"
}
Return
}
<#t::

launchOrSwitchToListen1()
Return



;启动或切换Potplayer
launchOrSwitchToPotplayer()
{
if WinExist("ahk_exe PotPlayer64.exe")
{
WinMinimizeAll
WinActivateBottom, ahk_exe PotPlayer64.exe
}
Else
{
WinMinimizeAll
Run "C:\Users\%A_Username%\scoop\apps\potplayer\current\PotPlayer64.exe"
}
Return
}

<#p::
launchOrSwitchToPotplayer()
Return

;启动或切换everything
launchOrSwitchToEverything()
{
if WinExist("ahk_exe Everything.exe")
{
WinActivateBottom, ahk_exe Everything.exe
}
Else
{
 Run "C:\Users\%A_Username%\scoop\apps\everything-alpha\current\Everything.exe"
}
Return
}

<#s::
launchOrSwitchToEverything()
Return

;启动或重启fancywm

;launchOrRelaunchFancywm()
;{
;if WinExist("ahk_exe FancyWM.exe")
;{
;process, close, FancyWM.exe ; Use the window found by WinExist.
;Sleep 1000
;Run, fancywm.exe, , hide
;}
;else
;{
;Run, fancywm.exe, , hide
;}
;Return
;}
;
;^+r::
;launchOrRelaunchFancywm()
;return

;<#+r::
;Run, fancywm.exe, , hide
;return
; vim way of handling windows


;启动或重启komorebi

/*
launchOrRelaunchkomorebi()
{
if WinExist("ahk_exe komorebi.exe")
{
Run, komorebic.exe "stop", , hide
process, close, komorebi.exe ; Use the window found by WinExist.
process, close, komorebic.exe ; Use the window found by WinExist.
Sleep 5000
Run, komorebic.exe "start", , hide
}
else
{
Run, komorebic.exe "start", , hide
}
Return
}

^+r::
launchOrRelaunchkomorebi()
return
*/


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;virtual desktop switcher ;;;;;;;;;;;;;;;;;;;;;;;;

; Globals
DesktopCount = 2 ; Windows starts with 2 desktops at boot
CurrentDesktop = 1 ; Desktop count is 1-indexed (Microsoft numbers them this way)
;
; This function examines the registry to build an accurate list of the current virtual desktops and which one we're currently on.
; Current desktop UUID appears to be in HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\VirtualDesktops
; List of desktops appears to be in HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops
;
mapDesktopsFromRegistry() {
 global CurrentDesktop, DesktopCount
 ; Get the current desktop UUID. Length should be 32 always, but there's no guarantee this couldn't change in a later Windows release so we check.
 IdLength := 32
 SessionId := getSessionId()
 if (SessionId) {
 RegRead, CurrentDesktopId, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionId%\VirtualDesktops, CurrentVirtualDesktop
 if (CurrentDesktopId) {
 IdLength := StrLen(CurrentDesktopId)
 }
 }
 ; Get a list of the UUIDs for all virtual desktops on the system
 RegRead, DesktopList, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
 if (DesktopList) {
 DesktopListLength := StrLen(DesktopList)
 ; Figure out how many virtual desktops there are
 DesktopCount := DesktopListLength / IdLength
 }
 else {
 DesktopCount := 1
 }
 ; Parse the REG_DATA string that stores the array of UUID's for virtual desktops in the registry.
 i := 0
 while (CurrentDesktopId and i < DesktopCount) {
 StartPos := (i * IdLength) + 1
 DesktopIter := SubStr(DesktopList, StartPos, IdLength)
 OutputDebug, The iterator is pointing at %DesktopIter% and count is %i%.
 ; Break out if we find a match in the list. If we didn't find anything, keep the
 ; old guess and pray we're still correct :-D.
 if (DesktopIter = CurrentDesktopId) {
 CurrentDesktop := i + 1
 OutputDebug, Current desktop number is %CurrentDesktop% with an ID of %DesktopIter%.
 break
 }
 i++
 }
}
;
; This functions finds out ID of current session.
;
getSessionId()
{
 ProcessId := DllCall("GetCurrentProcessId", "UInt")
 if ErrorLevel {
 OutputDebug, Error getting current process id: %ErrorLevel%
 return
 }
 OutputDebug, Current Process Id: %ProcessId%
 DllCall("ProcessIdToSessionId", "UInt", ProcessId, "UInt*", SessionId)
 if ErrorLevel {
 OutputDebug, Error getting session id: %ErrorLevel%
 return
 }
 OutputDebug, Current Session Id: %SessionId%
 return SessionId
}
;
; This function switches to the desktop number provided.
;
switchDesktopByNumber(targetDesktop)
{
 global CurrentDesktop, DesktopCount
 ; Re-generate the list of desktops and where we fit in that. We do this because
 ; the user may have switched desktops via some other means than the script.
 mapDesktopsFromRegistry()
 ; Don't attempt to switch to an invalid desktop
 if (targetDesktop > DesktopCount || targetDesktop < 1) {
 OutputDebug, [invalid] target: %targetDesktop% current: %CurrentDesktop%
 return
 }
 ; Go right until we reach the desktop we want
 while(CurrentDesktop < targetDesktop) {
 Send ^#{Right}
 CurrentDesktop++
 OutputDebug, [right] target: %targetDesktop% current: %CurrentDesktop%
 }
 ; Go left until we reach the desktop we want
 while(CurrentDesktop > targetDesktop) {
 Send ^#{Left}
 CurrentDesktop--
 OutputDebug, [left] target: %targetDesktop% current: %CurrentDesktop%
 }
}
;
; This function creates a new virtual desktop and switches to it
;
createVirtualDesktop()
{
 global CurrentDesktop, DesktopCount
 Send, #^d
 DesktopCount++
 CurrentDesktop = %DesktopCount%
 OutputDebug, [create] desktops: %DesktopCount% current: %CurrentDesktop%
}
;
; This function deletes the current virtual desktop
;
deleteVirtualDesktop()
{
 global CurrentDesktop, DesktopCount
 Send, #^{F4}
 DesktopCount--
 CurrentDesktop--
 OutputDebug, [delete] desktops: %DesktopCount% current: %CurrentDesktop%
}
; Main
SetKeyDelay, 75
mapDesktopsFromRegistry()
OutputDebug, [loading] desktops: %DesktopCount% current: %CurrentDesktop%
; User config!
; This section binds the key combo to the switch/create/delete actions
LWin & 1::switchDesktopByNumber(1)
LWin & 2::switchDesktopByNumber(2)
LWin & 3::switchDesktopByNumber(3)
LWin & 4::switchDesktopByNumber(4)
LWin & 5::switchDesktopByNumber(5)
LWin & 6::switchDesktopByNumber(6)
LWin & 7::switchDesktopByNumber(7)
LWin & 8::switchDesktopByNumber(8)
LWin & 9::switchDesktopByNumber(9)
;CapsLock & 1::switchDesktopByNumber(1)
;CapsLock & 2::switchDesktopByNumber(2)
;CapsLock & 3::switchDesktopByNumber(3)
;CapsLock & 4::switchDesktopByNumber(4)
;CapsLock & 5::switchDesktopByNumber(5)
;CapsLock & 6::switchDesktopByNumber(6)
;CapsLock & 7::switchDesktopByNumber(7)
;CapsLock & 8::switchDesktopByNumber(8)
;CapsLock & 9::switchDesktopByNumber(9)
;CapsLock & n::switchDesktopByNumber(CurrentDesktop + 1)
;CapsLock & p::switchDesktopByNumber(CurrentDesktop - 1)
;CapsLock & s::switchDesktopByNumber(CurrentDesktop + 1)
;CapsLock & a::switchDesktopByNumber(CurrentDesktop - 1)
;CapsLock & c::createVirtualDesktop()
;CapsLock & d::deleteVirtualDesktop()
; Alternate keys for this config. Adding these because DragonFly (python) doesn't send CapsLock correctly.
;^!1::switchDesktopByNumber(1)
;^!2::switchDesktopByNumber(2)
;^!3::switchDesktopByNumber(3)
;^!4::switchDesktopByNumber(4)
;^!5::switchDesktopByNumber(5)
;^!6::switchDesktopByNumber(6)
;^!7::switchDesktopByNumber(7)
;^!8::switchDesktopByNumber(8)
;^!9::switchDesktopByNumber(9)
;^!n::switchDesktopByNumber(CurrentDesktop + 1)
;^!p::switchDesktopByNumber(CurrentDesktop - 1)
;^!s::switchDesktopByNumber(CurrentDesktop + 1)
;^!a::switchDesktopByNumber(CurrentDesktop - 1)
;^!c::createVirtualDesktop()
;^!d::deleteVirtualDesktop()

