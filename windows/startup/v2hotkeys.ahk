;----------------------------- v2 specific  -------------------------

; This is a working in progress, not very much usable, a lot of todos

;TODO[ ] autoreload script
;TODO[ ] chrome.exe launch without console window

;----------------------------- v2 specific  -------------------------

/*
[NewScriptTemplate]
Description = Just #Requires v2.0
*/
#Requires AutoHotkey v2.0

; Official Documentation
; https://www.autohotkey.com/docs/v2/

;----------------------------- autoreload the script  -------------------------

; Manually reload the script
^r::Reload

; compare old file with new file changes, 
;if there's change, reload, if not,
;don't reload


;----------------------------- quick edit the script  -------------------------

#y::
{
    ;Run "wt.exe nvim.exe C:\Users\Wednesday\Downloads\Scripts\v2hotkeys.ahk"
    Run Format('wt.exe nvim.exe "{1}"', A_ScriptFullPath)
}

;----------------------------- Windows Terminal  -------------------------

#Enter::
{
    if WinExist("ahk_exe WindowsTerminal.exe") {
        WinActivate
    }
    else
    {
        ;Run 'wt.exe "nvim.exe"'
        ;Run "wt.exe nvim.exe"
        Run "wt.exe"
    }
}

;Force Close active window - Alt+F4
#q::
{
    if WinActive("ahk_exe WindowsTerminal.exe") {
        WinMinimize "A"
    }
    else
    {
    WinKill "A"
    }
}

;Close active tab - ctrl+w
#w::Send "^w"

;----------------------------- Most used apps  -------------------------

;chrome

#b::
{
    if WinExist("ahk_exe chrome.exe") {
        WinActivate
    }
    else
    {
       Run "C:\Users\Wednesday\scoop\apps\googlechrome\current\chrome.exe"
    }
}


;everything

#s::
{
    if WinExist("ahk_exe Everything.exe") {
        WinActivate
    }
    else
    {
       Run "C:\Users\Wednesday\scoop\apps\everything-alpha\current\Everything.exe"
    }
}
