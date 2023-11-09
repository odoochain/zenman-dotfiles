; ---- This is 100% autohotkey v2 script with the help of ChatGPT

; ---- auto-reload the script ---- v2

SetTimer(UPDATEDSCRIPT, 1000)

UPDATEDSCRIPT() {
    attribs := FileGetAttrib(A_ScriptFullPath)
    if (InStr(attribs, "A")) {
        FileSetAttrib("-A", A_ScriptFullPath)
        Reload()
    }
}
; --------------------    Real-time Editing   ---------------------------------

#y::EditCurrentScript()

EditCurrentScript() {
    wtpath := "wt"
    powershellpath := "powershell"
    nvimPath := "nvim"
    ; Run(wtpath " " powershellpath " " nvimPath " " A_ScriptFullPath)
    Run(nvimPath " " A_ScriptFullPath)
}

; ----------------------------------------------------------------------------

#q::Send("!{F4}")
#w::Send("^w")
#i::Run("ms-settings:bluetooth")
; empty recycle bin
^+d:: FileRecycleEmpty ; 清空回收站
<#z::Send("{Volume_mute}") ; with gui prompt

#m::MinimizeActiveWindow()

MinimizeActiveWindow() {
    WinMinimize("A") ; "A" stands for the active window
}

#h::WinMinimize("A")

#f::WinMaximize("A")

; ----------------------------------------------------------------------------

#Enter::ToggleWindowsTerminal()

ToggleWindowsTerminal() {
    if WinExist("ahk_exe WindowsTerminal.exe") {
        WinActivate
    } else {
        Run("wt")
        Sleep 1000
        WinActivate("ahk_class CASCADIA_HOSTING_WINDOW_CLASS", "", "bottom")
    }
}

#b::ToggleFireFox()

ToggleFireFox() {
    ; Define the path to Firefox using the A_UserName variable
    firefoxPath := "C:\Users\" A_UserName "\scoop\apps\firefox-nightly\current\firefox.exe"

    if WinExist("ahk_exe firefox.exe") {
        WinActivate
    } else {
        Run(firefoxPath)
    }
}

#o::ToggleFireFoxAria2()

ToggleFireFoxAria2() {
    ; Define the path to Firefox using the A_UserName variable
    firefoxPath := "C:\Users\" A_UserName "\scoop\apps\firefox-nightly\current\firefox.exe"
    aria2ManPath := "moz-extension://d1b0427c-3c20-44fd-a490-cc12ffd7a04f/ui/ariang/index.html#!/downloading"

    if WinExist("ahk_exe firefox.exe") {
        WinActivate
    } else {
        Run(firefoxPath " " aria2ManPath)
    }
}


#n::EditTodayNotes()

EditTodayNotes() {
    wtpath := "wt"
    powershellpath := "powershell"
    nvimPath := "nvim"
    ; Format the date as "YYYY-MM-DD"
    today := A_YYYY "-" A_MM "-" A_DD
    ; Construct the full path with the dynamic date in the filename
    todaynotesPath := "C:\Users\" A_UserName "\Downloads\Quicknotes\Raw\" today "_quicknotes.md"
    ; Run nvim with the file path
    ; Run(wtpath " " powershellpath " " nvimPath " " todaynotesPath)
    Run(nvimPath " " todaynotesPath)
}




#p::TogglePotplayer()

TogglePotplayer() {
    potplayerPath := "C:\Users\" A_UserName "\scoop\apps\potplayer\current\PotPlayer64.exe"
    if WinExist("ahk_exe potplayer.exe") {
        WinActivate
    } else {
        Run(potplayerPath)
    }
}

#g::ToggleSumatrapdf()

ToggleSumatrapdf() {
    sumatrapdfPath := "C:\Users\" A_UserName "\scoop\apps\sumatrapdf\current\sumatrapdf.exe"
    if WinExist("ahk_exe SumatraPDF.exe") {
        WinActivate("ahk_class SUMATRA_PDF_FRAME", "", "bottom")
    } else {
        Run(sumatrapdfPath)
    }
}

#t::ToggleSpotify()

ToggleSpotify() {
    ; Define the path to spotify using the A_UserName variable
    spotifyPath := "C:\Users\" A_UserName "\scoop\apps\spotify\current\spotify.exe"

    if WinExist("ahk_exe spotify.exe") {
        WinActivate
    } else {
        Run(spotifyPath)
    }
}

#s::ToggleEverything()

ToggleEverything() {
    ; Define the path to everything using the A_UserName variable
    everythingPath := "C:\Users\" A_UserName "\scoop\apps\everything-alpha\current\Everything.exe"

    if WinExist("ahk_exe everything.exe") {
        WinActivate
    } else {
        Run(everythingPath)
    }
}

#j::ToggleQalculate()

ToggleQalculate() {
    ; Define the path to qalculate using the A_UserName variable
    qalculatePath := "C:\Users\" A_UserName "\scoop\apps\Qalculate\current\qalculate-gtk.exe"

    if WinExist("ahk_exe qalculate.exe") {
        WinActivate
    } else {
        Run(qalculatePath)
    }
}

; 启动或切换到招商证券
#k::launchOrSwitchTdxW()
launchOrSwitchTdxW(){
    TdxWPath := "C:\Program Files (x86)\zd_zsone\TdxW.exe"
    if WinExist("ahk_class TdxW_MainFrame_Class") {
        WinActivate("ahk_class TdxW_MainFrame_Class", "", "bottom")
    } else {
        Sleep 1000
        Run(TdxWPath)
    }
}


; 启动或切换到下载目录
; win+e
#e::launchOrSwitchDownloads()

; Start or switch to Downloads directory
launchOrSwitchDownloads() {
    if WinExist("ahk_class CabinetWClass") {
        WinActivate("ahk_class CabinetWClass", "", "bottom")
    } else {
        Run("explorer shell:::{374DE290-123F-4565-9164-39C4925E467B}")
    }
}


; Toggle Task Manager with Win+X
#x::toggleTaskMan()

; Function to launch or switch to Task Manager
toggleTaskMan() {
    if WinExist("ahk_exe Taskmgr.exe") {
        WinActivate("ahk_exe Taskmgr.exe")
        WinWait("Task Manager")
        WinMaximize("A") ; Assumes the "A" last found window is the Task Manager
    } else {
        Run("taskmgr.exe")
    }
}


