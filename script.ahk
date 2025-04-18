﻿; start_script-run
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
Run, mods\nomousy.exe / hide
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
Run, C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe
Run, C:\Program Files\Google\Chrome\Application\chrome.exe
Run, C:\Users\user\AppData\Local\Programs\Microsoft VS Code\Code.exe
Run, C:\Windows\system32\cmd.exe
Run, C:\on-your-face\totalCMD\Totalcmd64.exe
Run, C:\Users\user\AppData\Roaming\Telegram Desktop\Telegram.exe
; soft_autorun-end

sleep, 2000

; soft-cords_autorun-start
EnvGet, deviceName, COMPUTERNAME
; Проверяем, соответствует ли имя устройства "nexeption-tpls"
if (deviceName != "nexeption-tpls") {
return  ; Если имя устройства не совпадает, выходим из скрипта
}
; Список окон и их целевые координаты
windows := []
windows.push({exe: "Telegram.exe",     x: 2180,  y: 0,    w: 380,  h: 1080})
windows.push({exe: "chrome.exe",       x: -1927, y: -77,  w: 1934, h: 1087})
windows.push({exe: "Code.exe",         x: 0,     y: 0,    w: 2180, h: 1080})
windows.push({exe: "Totalcmd64.exe",   x: -7,    y: 0,    w: 2194, h: 1087})
windows.push({exe: "cmd.exe",          x: -1927, y: -77,  w: 1934, h: 1087})
windows.push({exe: "lghub.exe",        x: -1920, y: -77,  w: 1920, h: 1080})

; Проверка положения окон и корректировка при необходимости
for index, win in windows {
; Исправляем: используем правильный доступ к имени исполняемого файла
exeName := win.exe
WinGet, hwnd, ID, ahk_exe %exeName%
if (hwnd) {
WinGetPos, wx, wy, ww, wh, ahk_id %hwnd%
if (wx != win.x || wy != win.y || ww != win.w || wh != win.h) {
WinMove, ahk_id %hwnd%, , win.x, win.y, win.w, win.h
}
}
}
WinGet, hwndCmd, ID, ahk_exe cmd.exe
if (hwndCmd) {
WinActivate, ahk_id %hwndCmd%
}
WinGet, hwndVscode, ID, ahk_exe Code.exe
if (hwndVscode) {
WinActivate, ahk_id %hwndVscode%
}
; soft-cords_autorun-end

; --- Функция SwitchToApp ---
SwitchToApp(appExe, appPath) {
    DetectHiddenWindows, On
    SetTitleMatchMode, 2

    ; Пробуем найти окно по имени процесса
    if WinExist("ahk_exe " . appExe)
    {
        WinActivate
    }
    else
    {
        Run, %appPath%
        WinWait, ahk_exe %appExe%
        WinActivate
    }
}

return


<^<!<+sc1C:: Run, c:\on-your-face\ahk\script.ahk
return

>#sc39::
EnvGet, deviceName, COMPUTERNAME
; Проверяем, соответствует ли имя устройства "nexeption-tpls"
if (deviceName != "nexeption-tpls") {
return  ; Если имя устройства не совпадает, выходим из скрипта
}
; Список окон и их целевые координаты
windows := []
windows.push({exe: "Telegram.exe",     x: 2180,  y: 0,    w: 380,  h: 1080})
windows.push({exe: "chrome.exe",       x: -1927, y: -77,  w: 1934, h: 1087})
windows.push({exe: "Code.exe",         x: 0,     y: 0,    w: 2180, h: 1080})
windows.push({exe: "Totalcmd64.exe",   x: -7,    y: 0,    w: 2194, h: 1087})
windows.push({exe: "cmd.exe",          x: -1927, y: -77,  w: 1934, h: 1087})
windows.push({exe: "lghub.exe",        x: -1920, y: -77,  w: 1920, h: 1080})

; Проверка положения окон и корректировка при необходимости
for index, win in windows {
; Исправляем: используем правильный доступ к имени исполняемого файла
exeName := win.exe
WinGet, hwnd, ID, ahk_exe %exeName%
if (hwnd) {
WinGetPos, wx, wy, ww, wh, ahk_id %hwnd%
if (wx != win.x || wy != win.y || ww != win.w || wh != win.h) {
WinMove, ahk_id %hwnd%, , win.x, win.y, win.w, win.h
}
}
}
; Сначала активируем cmd.exe
WinGet, hwndCmd, ID, ahk_exe cmd.exe
if (hwndCmd) {
WinActivate, ahk_id %hwndCmd%
}

; Затем активируем vscode (Code.exe)
WinGet, hwndVscode, ID, ahk_exe Code.exe
if (hwndVscode) {
WinActivate, ahk_id %hwndVscode%
}
return
; soft-cords_run-end

; mouse-block__run-start
<^sc1::
if (Mouse_Blocked) {
Run,mods\nomousy.exe
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

<#Space:: SendPlay, ^t
return

<!sc1:: SendInput, {sc29}
return

>^sc1:: WinClose, A
return

<#-:: SendInput, U+2014
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

>#sc1::
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

>#1::
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

>#f::
WinActivate, ahk_exe Telegram.exe
WinWaitActive, ahk_exe Telegram.exe
Run, tg://resolve?domain=nexeption
CoordMode, Mouse, Screen
MouseMove, 2501, 50, 0
Sleep, 400
Click, left
Send, ^a
Send, ^v
Sleep, 400
MouseMove, 2365, 205, 0
Sleep, 1000
Click, left
clipboard := ""
return

; Win + Q → Total Commander
<#q::
SwitchToApp("Totalcmd64.exe", "c:\on-your-face\totalcmd\Totalcmd64.exe")
return

; Win + Z → Telegram
<#z::
SwitchToApp("Telegram.exe", "C:\Users\user\AppData\Roaming\Telegram Desktop\Telegram.exe")
return

; Win + 1 → Chrome
<#1::
SwitchToApp("chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
return

; Win + A → VS Code
<#a::
SwitchToApp("Code.exe", "C:\Users\user\AppData\Local\Programs\Microsoft VS Code\Code.exe")
return

; Win + S → CMD
<#s::
SwitchToApp("cmd.exe", "C:\Windows\system32\cmd.exe")
return

; CapsLock + ESC → Logitech
sc3A & sc1::
SwitchToApp("lghub.exe", "C:\Windows\system32\cmd.exe")
return