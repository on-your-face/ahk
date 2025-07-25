﻿#NoTrayIcon
#Persistent
#UseHook
#SingleInstance Force

SetWorkingDir %A_ScriptDir%

#Include c:\git\ahk\mods\VD.ahk-class_VD\VD.ahk
#Include c:\git\ahk\mods\VD.ahk-class_VD\_VD.ahk

if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

VD.init()
VD.createUntil(2)

; mouse-block__autorun-begin
Mouse_Blocked := false
Run,mods\nomousy.exe / hide
BlockInput, MouseMove
Mouse_Blocked := true
; mouse-block__autorun-end

Run, C:\Program Files\Google\Chrome\Application\chrome.exe
WinWait, ahk_exe chrome.exe
Run, C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe
WinWait, ahk_exe lghub.exe
Run, C:\Users\user\AppData\Local\Programs\Microsoft VS Code\Code.exe
WinWait, ahk_exe Code.exe
Run, C:\Windows\system32\cmd.exe
WinWait, ahk_exe cmd.exe
Run, C:\on-your-face\totalCMD\Totalcmd64.exe
WinWait, ahk_exe Totalcmd64.exe
Run, C:\Users\user\AppData\Roaming\Telegram Desktop\Telegram.exe
WinWait, ahk_exe Telegram.exe

global telegram_hwnd
telegram_hwnd := WinExist("ahk_exe Telegram.exe")
sleep, 1000

; window-cords__autorun-begin
EnvGet, deviceName, COMPUTERNAME
windows := []
if (deviceName = "nexeption-tpls") {
windows.push({exe: "Telegram.exe",   x: -400,  y: -77,	w: 400,	 h: 1080})
windows.push({exe: "chrome.exe",     x: -1927,	y: -77,	w: 1534, h: 1087})
windows.push({exe: "Code.exe",       x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "Totalcmd64.exe", x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "cmd.exe",        x: -1927,	y: -77,	w: 1534,	h: 1087})
windows.push({exe: "lghub.exe",      x: -1920,	y: -77,	w: 1520,	h: 1080})
} else if (deviceName = "nexeption-home") {
windows.push({exe: "Telegram.exe",   x: 2174,	y: 0,	w: 386,	h: 1080})
windows.push({exe: "chrome.exe",     x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "Code.exe",       x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "Totalcmd64.exe", x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "cmd.exe",        x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "lghub.exe",      x: 0,     y: 0,    w: 2560, h: 1080})
} else {
return
}
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
; window-cords__autorun-end

WinActivate, ahk_exe cmd.exe
WinActivate, ahk_exe Code.exe
WinWaitActive, ahk_exe Code.exe, , 3

; switch-lang__autorun-begin
SetKeyboardLayout(0x0409)
ToggleKeyboardLayout() {
static isRussian := false
isRussian := !isRussian
if isRussian
SetKeyboardLayout(0x0419)
else
SetKeyboardLayout(0x0409)
}
SetKeyboardLayout(LocaleID) {
hKL := DllCall("LoadKeyboardLayout", "Str", Format("{:08X}", LocaleID), "UInt", 1)
hwnd := WinActive("A")
PostMessage, 0x50, 0, hKL,, ahk_id %hwnd%
}
; switch-lang__autorun-end

return
<^<!<+sc1C:: Run, c:\git\ahk\script.ahk
return
; soft-cords_run-start
>#sc39:: 
EnvGet, deviceName, COMPUTERNAME
windows := []
if (deviceName = "nexeption-tpls") {
    windows.push({exe: "Telegram.exe",   x: -400,  y: -77,	w: 400,	 h: 1080})
    windows.push({exe: "chrome.exe",     x: -1927,	y: -77,	w: 1534, h: 1087})
    windows.push({exe: "Code.exe",       x: 0,     y: 0,    w: 2560, h: 1080})
    windows.push({exe: "Totalcmd64.exe", x: -7,    y: 0,    w: 2574, h: 1087})
    windows.push({exe: "cmd.exe",        x: -1927,	y: -77,	w: 1534,	h: 1087})
    windows.push({exe: "lghub.exe",      x: -1920,	y: -77,	w: 1520,	h: 1080})
} else if (deviceName = "nexeption-home") {
windows.push({exe: "Telegram.exe",                  x: 2174,	y: 0,	w: 386,	h: 1080})
windows.push({exe: "chrome.exe",                    x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "Code.exe",                      x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "Totalcmd64.exe",                x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "cmd.exe",                       x: -7,    y: 0,    w: 2574, h: 1087})
windows.push({exe: "lghub.exe",                     x: 0,     y: 0,    w: 2560, h: 1080})
windows.push({exe: "steamwebhelper.exe",            x: 0,     y: 0,	   w: 2560,	h: 1079})
windows.push({exe: "qbittorrent.exe",            x: -7,	y: 0,	w: 2574,	h: 1087})
} else {
return
}
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

; browsers-hotkeys__start
#If WinActive("ahk_exe chrome.exe")
|| WinActive("ahk_exe chromium.exe")
|| WinActive("ahk_exe firefox.exe")
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
Send, {LControl down}{LButton down}{LButton up}{LControl up}
    Sleep, 200
    Send, {Lctrl down}{Tab down}{Lctrl up}{Tab up}
return
#If
; browsers-hotkeys__end

sc3A & sc1::
IfWinExist, ahk_exe lghub.exe
WinActivate
else
Run, C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe
return

<#1::
SetTitleMatchMode, 2 ; ищем по части заголовка

IfWinExist, Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
{
    WinGetTitle, winTitle
    if !InStr(winTitle, "DevTools")
        WinActivate
    else
        Run, C:\Program Files\Google\Chrome\Application\chrome.exe
}
else
{
    Run, C:\Program Files\Google\Chrome\Application\chrome.exe
}
return

<#2::
SetTitleMatchMode, 2
IfWinExist, DevTools ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
    WinActivate
return

<#3::
IfWinExist, ahk_exe qbittorrent.exe
{
    WinActivate
}
else
Run, C:\Program Files\qBittorrent\qbittorrent.exe
WinWait, ahk_exe qbittorrent.exe
WinActivate
return

<#a::
IfWinExist, ahk_exe Code.exe
WinActivate
else
Run, C:\Users\user\AppData\Local\Programs\Microsoft VS Code\Code.exe
return

<#q::
IfWinExist, ahk_exe Totalcmd64.exe
WinActivate
else
Run, C:\on-your-face\totalCMD\Totalcmd64.exe
return

<#w::
IfWinExist, ahk_exe xnviewmp.exe
{
    WinActivate
}
else
{
    Run, "C:\Program Files\XnViewMP\xnviewmp.exe"
    WinWait, ahk_exe xnviewmp.exe
    WinActivate
}
return

<#f::
IfWinExist, ahk_exe notepad++.exe
{
    WinActivate
}
else
{
    Run, "C:\Program Files\Notepad++\notepad++.exe"
    WinWait, ahk_exe notepad++.exe
    WinActivate
}
return


<#s::
IfWinExist, ahk_exe cmd.exe
WinActivate
else
Run, C:\Windows\system32\cmd.exe
return


; Настройки подключённых устройств (начало)
<#c:: ; Win + Q
IfWinExist, ahk_class ApplicationFrameWindow ahk_exe SystemSettings.exe
{
    WinActivate
}
else
{
    Run, "C:\on-your-face\CFW\settings (win 10)\connecteddevices.url"
}
return
; Настройки подключённых устройств (конец)

>#<+sc39::
WinMove, ahk_exe chrome.exe, , -7, 0, 2574, 1087
WinActivate, ahk_exe chrome.exe
return

CheckTelegramActive() {
    WinGetTitle, winTitle, A
    return InStr(winTitle, "Telegram")
}

EnsureTelegramActive() {
    if !WinActive("ahk_exe Telegram.exe") {
        WinActivate, ahk_exe Telegram.exe
        WinWaitActive, ahk_exe Telegram.exe
        Sleep, 300
    }
}

<^<#z::
EnsureTelegramActive()
Send, ^0
return

<^<#x::
EnsureTelegramActive()
Send, ^9
return

<^<#v::
if !WinActive("ahk_exe Telegram.exe") {
    WinActivate, ahk_exe Telegram.exe
    WinWaitActive, ahk_exe Telegram.exe
    Sleep, 300
}
SendInput, 197346825{!}
SendInput, {Enter}
return
return

<^<#b::
EnsureTelegramActive()
Send, ^l
return

<^<#c::
Run, mods\nomousy.exe /hide
BlockInput, MouseMove
Mouse_Blocked := true

EnsureTelegramActive()
Send, ^0
Sleep, 300
Send, ^f
Send, ^v
Sleep, 1500
Send, {Down}{Enter}
clipboard := ""

Run, mods\nomousy.exe
BlockInput, MouseMoveOff
Mouse_Blocked := false
return



#if (A_ComputerName = "nexeption-tpls")
>#a::
VD.goToDesktopNum(2)
Run, "C:\Program Files\Google\Chrome\Application\chrome.exe"
WinWait, ahk_exe chrome.exe
WinGet, chromeID, ID, ahk_exe chrome.exe
WinMove, ahk_id %chromeID%, , 1273, 0, 1294, 1087
Run, "C:\Program Files\Google\Chrome\Application\chrome.exe"
WinWait, ahk_exe chrome.exe
WinGet, chromeID2, ID, ahk_exe chrome.exe
WinActivate, ahk_id %chromeID2%
Sleep, 500
WinMove, ahk_id %chromeID2%, , -7, 0, 1294, 1087
sleep, 100
CoordMode, Mouse, Screen
MouseMove, 1494, 64
Click, left
clipboard := "https://edu.rosminzdrav.ru/"
Send ^v
Send, {Enter}
MouseMove, 196, 64
Click, left
clipboard := "https://24forcare.com/"
Send ^v
Send, {Enter}
MouseMove, 2442, 208
return

>#s::
CoordMode, Mouse, Screen
MouseMove, 1389, 467
Click, left
Click, left
Click, left
Send, {LControl down}
Send, {c}
Send, {LControl up}
MouseMove, 596, 107
Click, left
Sleep, 50
Send, {LControl down}
Send, {a}
Send, {v}
Send, {LControl up}
Send, {Enter}
MouseMove, 1732, 641
return

>#d::
CoordMode, Mouse, Screen
MouseMove, 2539, 22
Click, left
MouseMove, 1254, 16
Click, left
VD.goToDesktopNum(1)
return
#if

; hotkeys-vd__begin
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
; hotkeys-vd__end

; hotkeys__begin
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
<^<#<!Right:: Run, c:\git\ahk\mods\nircmd-x64\nircmd.exe standby 
return
<^<#<!Left:: Run, c:\git\ahk\mods\nircmd-x64\nircmd.exe exitwin logoff
return
<^<#<!Up:: Run, c:\git\ahk\mods\nircmd-x64\nircmd.exe exitwin reboot
return
<^<#<!Down:: Run, c:\git\ahk\mods\nircmd-x64\nircmd.exe exitwin poweroff
return
; hotkeys__end

; hotkeys-telegram__begin
#If WinActive("ahk_exe Telegram.exe")
>+q::
Send, {Lctrl down}{Lshift down}{M}{Lctrl up}{Lshift up}
return
#If
; hotkeys-telegram__end

; hotkeys-cmd__begin
#If WinActive("ahk_exe cmd.exe")
>+sc1::
clipboard := "cls"
ClipWait
Send ^v
Send {Enter}
return
>+1::
clipboard := "cd /d ""c:\git\ahk\""" 
ClipWait
Send ^v
Send {Enter}
return
>+2::
clipboard := "cd /d ""c:\git\bookmarks\bkmrks_a\""" 
ClipWait
Send ^v
Send {Enter}
return
>+3::
clipboard := "cd /d ""c:\git\bookmarks\bkmrks_b\""" 
ClipWait
Send ^v
Send {Enter}
return
; >+4::
; clipboard := "cd /d ""c:\git\bookmarks\software\""" 
; ClipWait
; Send ^v
; Send {Enter}
; return
>+z::
clipboard := "cd /d ""c:\git\nexeption (site)""" 
ClipWait
Send ^v
Send {Enter}
return
>+x::
clipboard := "cd /d ""c:\git\happy_holiday""" 
ClipWait
Send ^v
Send {Enter}
return
>+4::
clipboard := "cd /d ""c:\git\backups""" 
ClipWait
Send ^v
Send {Enter}
return
>+a::
clipboard := "cd /d ""c:\git\webTemplate""" 
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
; hotkeys-cmd__end

; mouse-jump__begin
deviceName := "nexeption-tpls"  ; пример задания переменной, замени на своё получение имени устройства

#if (deviceName = "nexeption-tpls")

>#1::
    CoordMode, Mouse, Screen
    MouseMove, -955, 451, 0  ; мгновенное перемещение
return

>#2::
    CoordMode, Mouse, Screen
    MouseMove, 752, 511, 0  ; мгновенное перемещение
return

>#3::
    CoordMode, Mouse, Screen
    MouseMove, 2011, 526, 0  ; мгновенное перемещение
return

#if  ; отключение условия
; mouse-jump__end

<#z::
; Проверка: актуален ли hwnd (существует ли такое окно)
if telegram_hwnd && WinExist("ahk_id " . telegram_hwnd)
{
    WinActivate, ahk_id %telegram_hwnd%
}
else
{
    ; Если Telegram не найден или hwnd устарел
    if !WinExist("ahk_exe Telegram.exe")
    {
        Run, C:\Users\user\AppData\Roaming\Telegram Desktop\Telegram.exe
        WinWait, ahk_exe Telegram.exe
    }

    ; Обновляем hwnd и активируем
    telegram_hwnd := WinExist("ahk_exe Telegram.exe")
    if telegram_hwnd
        WinActivate, ahk_id %telegram_hwnd%
}
return


<#x::
IfWinExist, ahk_exe KingdomCome.exe
    WinActivate
else
    Run, c:\Games\Kingdom.Come.Deliverance.II.Gold.Edition-InsaneRamZes\Bin\Win64MasterMasterSteamPGO\KingdomCome.exe
return

; kcd 2 hotkey
#If WinActive("ahk_exe KingdomCome.exe")
toggle := false

Home::
toggle := !toggle
if (toggle) {
    Send, {w down}
    SetTimer, RotateMouse, 2000
} else {
    Send, {w up}
    SetTimer, RotateMouse, Off
}
return

RotateMouse:
    ; Поворот мыши на 180 градусов вправо (относительно текущего положения)
    ; Движение мыши по горизонтали вправо (большое значение — быстрое вращение)
    ; Можно скорректировать значение 3000 в зависимости от чувствительности
    DllCall("mouse_event", "UInt", 0x01, "Int", 3000, "Int", 0, "UInt", 0, "UPtr", 0)
return

>^1::
SendInput, {5 down}
Sleep, 3000
SendInput, {5 up}
return

>^2::
SendInput, {6 down}
Sleep, 3000
SendInput, {6 up}
return

>^3::
SendInput, {7 down}
Sleep, 3000
SendInput, {7 up}
return

>^4::
SendInput, {8 down}
Sleep, 3000
SendInput, {8 up}
return

; >^e::
; SendInput, e                    ; Нажатие E
; Sleep, 800                      ; Пауза 0.8 сек
; Send, {w down}                 
; Sleep, 1000                     ; Зажатие W на 1 сек
; Send, {w up}
; MouseMove, 210, 0, 5, R         ; Поворот вправо немного сильнее
; SendInput, e                    ; Снова E
; Sleep, 3500                     ; Пауза
; MouseMove, -210, 0, 5, R        ; Возврат мыши
; return
#If