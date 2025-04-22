; start_script-run
if not A_IsAdmin
{
Run *RunAs "%A_ScriptFullPath%"
ExitApp
}
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
#Include c:\on-your-face\ahk\mods\VD.ahk-class_VD\VD.ahk
#Include c:\on-your-face\ahk\mods\VD.ahk-class_VD\_VD.ahk
VD.init()
VD.createUntil(2)
; start_script-end

; mouse-block__autorun-start
Mouse_Blocked := false
Run,mods\nomousy.exe / hide
BlockInput, MouseMove
Mouse_Blocked := true
; mouse-block__autorun-end

; switch-lang_autorun-start
SetKeyboardLayout(0x0409) ; переключение языка на англ. со старта
ToggleKeyboardLayout() {
static isRussian := false
isRussian := !isRussian
if isRussian
SetKeyboardLayout(0x0419) ; ru-RU
else
SetKeyboardLayout(0x0409) ; en-US
}
SetKeyboardLayout(LocaleID) {
hKL := DllCall("LoadKeyboardLayout", "Str", Format("{:08X}", LocaleID), "UInt", 1)
hwnd := WinActive("A")
PostMessage, 0x50, 0, hKL,, ahk_id %hwnd% ; Меняем в активном окне
}
; switch-lang_autorun-end

; soft_autorun-start

; Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
; WinWait, ahk_exe firefox.exe

Run, C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe
WinWait, ahk_exe lghub.exe

Run, C:\Program Files\Google\Chrome\Application\chrome.exe
WinWait, ahk_exe chrome.exe

Run, C:\Users\user\AppData\Local\Programs\Microsoft VS Code\Code.exe
WinWait, ahk_exe Code.exe

Run, C:\Windows\system32\cmd.exe
WinWait, ahk_exe cmd.exe

Run, C:\on-your-face\totalCMD\Totalcmd64.exe
WinWait, ahk_exe Totalcmd64.exe

Run, C:\Users\user\AppData\Roaming\Telegram Desktop\Telegram.exe
WinWait, ahk_exe Telegram.exe

; Run, c:\on-your-face\zapret-win-bundle-master\zapret-winws\preset_russia_autohostlist.cmd

; soft_autorun-end

sleep, 2000

; soft-cords_autorun-start
EnvGet, deviceName, COMPUTERNAME

; Определяем координаты окон в зависимости от имени устройства
windows := []

if (deviceName = "nexeption-tpls") {
windows.push({exe: "Telegram.exe",   x: 2180,  y: 0,    w: 380,  h: 1080})
windows.push({exe: "firefox.exe",    x: -7,	y: 0,	w: 2574,	h: 1087})
windows.push({exe: "chrome.exe",     x: -1927, y: -77,  w: 1934, h: 1087})
windows.push({exe: "Code.exe",       x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "Totalcmd64.exe", x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "cmd.exe",        x: -1927,	y: -77,	w: 1934, h: 1087})
windows.push({exe: "lghub.exe",      x: -1920, y: -77,  w: 1920, h: 1080})
} else if (deviceName = "nexeption-home") {
windows.push({exe: "Telegram.exe",   x: 2180,  y: 0,    w: 380,  h: 1080})
windows.push({exe: "chrome.exe",     x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "Code.exe",       x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "Totalcmd64.exe", x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "cmd.exe",        x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "lghub.exe",      x: 0,     y: 0,    w: 2560, h: 1080})
} else {
return
}

; Проверка положения окон и корректировка при необходимости
for index, win in windows {
exeName := win.exe
WinGet, hwnd, ID, ahk_exe %exeName%
if (hwnd) {
WinGetPos, wx, wy, ww, wh, ahk_id %hwnd%
if (wx != win.x || wy != win.y || ww != win.w || wh != win.h) {
WinMove, ahk_id %hwnd%, , win.x, win.y, win.w, win.h
}
}
}

WinGet, hwndCmd, ID, ahk_exe Code.exe
if (hwndCmd) {
WinActivate, ahk_id %hwndCmd%
}

WinGet, hwndCode, ID, ahk_exe Code.exe
if (hwndCode) {
WinActivate, ahk_id %hwndCode%
}

; soft-cords_autorun-end

return

<^<!<+sc1C:: Run, c:\on-your-face\ahk\script.ahk
return

; soft-cords_run-start
>#sc39:: 
EnvGet, deviceName, COMPUTERNAME

; Список окон и их координаты в зависимости от устройства
windows := []

if (deviceName = "nexeption-tpls") {
windows.push({exe: "Telegram.exe",                  x: 2180,  y: 0,    w: 380,  h: 1080})
windows.push({exe: "chrome.exe",                    x: -1927, y: -77,  w: 1934, h: 1087})
windows.push({exe: "firefox.exe",    x: -7,	y: 0,	w: 2574,	h: 1087})
windows.push({exe: "Code.exe",                      x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "Totalcmd64.exe",                x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "cmd.exe",        x: -1927,	y: -77,	w: 1934, h: 1087})
windows.push({exe: "lghub.exe",                     x: -1920, y: -77,  w: 1920, h: 1080})
} else if (deviceName = "nexeption-home") {
windows.push({exe: "Telegram.exe",                  x: 2180,  y: 0,    w: 380,  h: 1080})
windows.push({exe: "chrome.exe",                    x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "Code.exe",                      x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "Totalcmd64.exe",                x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "cmd.exe",                       x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "lghub.exe",                     x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "steamwebhelper.exe",            x: 0,     y: 0,	   w: 2560,	h: 1079})
} else {
return  ; Неизвестное устройство — выход
}

; Проверка положения окон и корректировка при необходимости
for index, win in windows {
exeName := win.exe
WinGet, hwnd, ID, ahk_exe %exeName%
if (hwnd) {
WinGetPos, wx, wy, ww, wh, ahk_id %hwnd%
if (wx != win.x || wy != win.y || ww != win.w || wh != win.h) {
WinMove, ahk_id %hwnd%, , win.x, win.y, win.w, win.h
}
}
}
return
; soft-cords_run-end

; firefox_style-start
>#sc1::
WinClose, ahk_exe firefox.exe
userChromePath := "c:\users\user\appdata\roaming\mozilla\firefox\Profiles\b8lnxhe3.default-release\chrome\userChrome.css"
styleBlock =
(
<style>
#TabsToolbar {
visibility: collapse !important;
}

#titlebar {
visibility: collapse !important;
}

#navigator-toolbox {
visibility: collapse !important;
}

#statuspanel {
display: none !important;
}

#tabbrowser-tabpanels {
background-color: #000000 !important;
}

#browser {
background-color: #000000 !important;
}
</style>
)
if FileExist(userChromePath) {
FileDelete, %userChromePath%
} else {
FileAppend, %styleBlock%, %userChromePath%
}
Sleep, 1000
Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
return
; firefox_style-end

; mouse-block__run-start
<^sc1::
if (Mouse_Blocked) {
Run, mods\nomousy.exe
BlockInput, MouseMoveOff
Mouse_Blocked := false
} else {
Run, mods\nomousy.exe / hide
BlockInput, MouseMove
Mouse_Blocked := true
}
return
#If (Mouse_Blocked)
LButton::
RButton::
MButton::
WheelUp::
WheelDown::
return
#If
; mouse-block__run-end

; switch-lang_run-start
sc03A:: 
ToggleKeyboardLayout()
return
; switch-lang_run-end

; checklang__run-start
>^z::
{
TipLayout("show")
KeyWait, z
TipLayout("hide")
}
return
TipLayout(Action)
{
static tooltipID := 0
if (Action = "show") {
CurrentLayout := GetLayout()
ToolTip, % CurrentLayout, , , , tooltipID
} else if (Action = "hide") {
ToolTip
}
}
GetLayout()
{
threadId := DllCall("GetWindowThreadProcessId", "Ptr", WinExist("A"), "UInt", 0, "Ptr")
langId := DllCall("GetKeyboardLayout", "Ptr", threadId, "Ptr") & 0xFFFF
if (langId = 0x409)
CurrentLayout := "En"
else
CurrentLayout := "Ru"
return CurrentLayout
}
return
; checklang__run-end

>^q:: SendPlay, ^o
return

>^w:: SendPlay, {F5}
return

>^<+w:: SendPlay, ^{F5}
return

>^e:: SendPlay, {Enter}
return

>^a:: SendPlay, {Backspace}
return

>^s:: SendPlay, {F2}
return

>^d:: SendPlay, {Delete}
return

>^f:: SendPlay, ^{Enter}
return

<#sc39:: SendPlay, ^t
return

<!sc1:: SendInput, {sc29}
return

>^sc1:: WinClose, A
return

<#-:: SendInput, {U+2014}
return

<#<!-:: SendInput, {U+2013}
return

<#sc28:: SendInput, {U+00AB}{U+00BB}
return

<#sc35:: SendInput, {U+2026}
return

CapsLock::
return

<^<!+a:: Run, C:\Program Files\AutoHotkey\WindowSpy.ahk
return

<#sc1:: Run, C:\Program Files\CloseAll\CloseAll.exe /NOUI
return

<^<#<!Right:: Run, mods\nircmd-x64\nircmd.exe standby
return

<^<#<!Left:: Run, mods\nircmd-x64\nircmd.exe exitwin logoff
return

<^<#<!Up:: Run, mods\nircmd-x64\nircmd.exe exitwin reboot
return

<^<#<!Down:: Run, mods\nircmd-x64\nircmd.exe exitwin poweroff
return

#If WinActive("ahk_exe Code.exe")
>+1::
Send, {F1}
return

>+q::
clipboard := "<div class=""element ghost""></div>"
Send ^v
return

>+s::
Send, {LAlt down}{LShift down}{Down}{LShift up}{LAlt up}
return
#If


; browsers-hotkeys_start
#If WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe")
>+a::
Send, {Lalt Down}{Left Down}{Lalt Up}{Left Up}
return
>+d::
Send, {Lalt Down}{Right Down}{Lalt Up}{Right Up}
return
>+f::
Send, {F11}
return
>+z::Send, ^1
return
>+x::Send, ^2
return
>+c::Send, ^3
return
>+v::Send, ^4
return
>+b::Send, ^5
return
>+n::Send, ^6
return
>+m::Send, ^7
return
<^MButton::
    Click, MButton
    Sleep, 200
    Send, {Lctrl down}{Tab down}{Lctrl up}{Tab up}
return
#If
; browsers-hotkeys_end

SC03A & 1::
if GetKeyState("LShift", "P") {
VD.MoveWindowToDesktopNum("A", 1)
}
else if GetKeyState("LAlt", "P") {
VD.MoveWindowToDesktopNum("A", 1)
VD.goToDesktopNum(1)
}
else {
VD.goToDesktopNum(1)
}
return
SC03A & 2::
if GetKeyState("LShift", "P") {
VD.MoveWindowToDesktopNum("A", 2)
}
else if GetKeyState("LAlt", "P") {
VD.MoveWindowToDesktopNum("A", 2)
VD.goToDesktopNum(2)
}
else {
VD.goToDesktopNum(2)
}
return
SC03A & 3::
if GetKeyState("LShift", "P") {
VD.MoveWindowToDesktopNum("A", 3)
}
else if GetKeyState("LAlt", "P") {
VD.MoveWindowToDesktopNum("A", 3)
VD.goToDesktopNum(3)
}
else {
VD.goToDesktopNum(3)
}
return
SC03A & 4::
if GetKeyState("LShift", "P") {
VD.MoveWindowToDesktopNum("A", 4)
}
else if GetKeyState("LAlt", "P") {
VD.MoveWindowToDesktopNum("A", 4)
VD.goToDesktopNum(4)
}
else {
VD.goToDesktopNum(4)
}
return

#If WinActive("ahk_exe cmd.exe")
>+sc1::
clipboard := "cls"
ClipWait
Send ^v
Send {Enter}
return

>+z::
clipboard := "cd /d ""C:\on-your-face\bookmarks\""" 
ClipWait
Send ^v
Send {Enter}
return

>+x::
clipboard := "cd /d ""C:\on-your-face\ahk\""" 
ClipWait
Send ^v
Send {Enter}
return

>+q::
clipboard := "git add . && git commit -m ok && git push"
ClipWait
Send ^v
Send {Enter}
return

>+w::
clipboard := "git pull origin main"
ClipWait
Send ^v
Send {Enter}
return
#If

; telegram-hotkeys_start

>#1::
CoordMode, Mouse, Screen
MouseMove, 1340, 498, 0
return

>#2::
CoordMode, Mouse, Screen
MouseMove, -926, 436, 0
return

>#z::
WinActivate, ahk_exe Telegram.exe
WinWaitActive, ahk_exe Telegram.exe
Run, tg://resolve?domain=nexeption
Sleep, 200
Send, {Esc}
CoordMode, Mouse, Screen
MouseMove, 2533, 49, 0
Sleep, 200
Click, left
return

>#x::
WinActivate, ahk_exe Telegram.exe
WinWaitActive, ahk_exe Telegram.exe
CoordMode, Mouse, Screen
MouseMove, 2295, 414, 0
Sleep, 200
Click, left
clipboard := "ti_down"
Send ^v
MouseMove, 2358, 498, 0
Click, left
clipboard := ""
return

>#c::
Run, mods\nomousy.exe /hide
BlockInput, MouseMove
Mouse_Blocked := true
WinActivate, ahk_exe Telegram.exe
WinWaitActive, ahk_exe Telegram.exe
Run, tg://resolve?domain=nexeption
sleep, 300
Send, {Lctrl down} {f} {Lctrl up}
Send, {Lctrl down} {v} {Lctrl up}
Sleep, 400
CoordMode, Mouse, Screen
MouseMove, 2358, 209, 0
Sleep, 1000
Click, left
clipboard := ""
Run, mods\nomousy.exe
BlockInput, MouseMoveOff
Mouse_Blocked := false
return
; telegram-hotkeys_end

; Для lghub.exe (sc3A & sc1)
sc3A & sc1::
IfWinExist, ahk_exe lghub.exe
WinActivate
else
Run, C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe
return

; <#1::
; IfWinExist, ahk_exe firefox.exe
; WinActivate
; else
; Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
; return

<#1::
IfWinExist, ahk_exe chrome.exe
WinActivate
else
Run, C:\Program Files\Google\Chrome\Application\chrome.exe
return

; Для Code.exe (<#a) — Windows+A
<#a::
IfWinExist, ahk_exe Code.exe
WinActivate
else
Run, C:\Users\user\AppData\Local\Programs\Microsoft VS Code\Code.exe
return

; Для Totalcmd64.exe (<#q) — Windows+Q
<#q::
IfWinExist, ahk_exe Totalcmd64.exe
WinActivate
else
Run, C:\on-your-face\totalCMD\Totalcmd64.exe
return

; Для cmd.exe (<#s) — Windows+S
<#s::
IfWinExist, ahk_exe cmd.exe
WinActivate
else
Run, C:\Windows\system32\cmd.exe
return

<#z::
if WinExist("ahk_exe Telegram.exe") {
    WinActivate
    WinWaitActive, ahk_exe Telegram.exe
} else {
    Run, C:\Users\user\AppData\Roaming\Telegram Desktop\Telegram.exe
    WinWaitActive, ahk_exe Telegram.exe
}
return

<#x::
if (A_ComputerName = "nexeption-home")
{
    IfWinExist, ahk_exe steamwebhelper.exe
        WinActivate
    else
        Run, "C:\Program Files (x86)\Steam\steam.exe"
}
return

<^<#q::
if (A_ComputerName = "nexeption-home")
{
    if WinExist("ahk_exe cs2.exe")
    {
        WinActivate
    }
    else
    {
        Run, steam://rungameid/730
    }
}
return

<^<#w::
if (A_ComputerName = "nexeption-home")
{
    if WinExist("ahk_exe dota2.exe")
    {
        WinActivate
    }
    else
    {
        Run, steam://rungameid/570
    }
}
return
