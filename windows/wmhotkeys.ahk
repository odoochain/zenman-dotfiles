; window utils

<#q::
WinClose, A
return

<#Enter::
Run, wt.exe
return

<#b::
Run, chrome.exe, , hide
return


<#+r::
Run, fancywm.exe, , hide
return
; vim way of handling windows

; manage windows
<#f::
WinGet,S,MinMax,A
if S=0
    WinMaximize,A
else if S=1
    WinRestore,A
else if S=-1
    WinRestore,A
return

#m:: ;窗口最小化
WinMinimize, A
return

#c:: ;mouse pick color value(RGB/CSS)
MouseGetPos, mouseX, mouseY
PixelGetColor, color, %mouseX%, %mouseY%,RGB
StringRight color,color,6
clipboard = %color%
return
