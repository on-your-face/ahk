if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}
SetWorkingDir %A_ScriptDir%
Process, Priority,, H

SetWinDelay -1
SetControlDelay -1

;START of gui stuff
Gui,Font, s12, Segoe UI
explanation=
(
Numpad0 to pin this Window on all desktops
you can spam (Numpad2,Numpad1,Numpad2,Numpad1) for fun

here's a challenge (you might lose this window):
Unpin this using Numpad0
go to Desktop 3 (Numpad3)
this time, use Win + * on Numpad to come back to this window wherever you are
(and wherever this window is)
so you can move this window to desktop 2 (Numpad5), you go to desktop 1, and use Win + * on Numpad
(if you want to search in this script, the hotkey is #NumpadMult)

(You might want to pin this window for this part):
!NumpadAdd (Alt + Numpad+) to createDesktop and go to it
f1 to see which desktop you currently are in

but at this point, just use Win + Tab..
these functions are mostly for script only,
for example: I used VD.createUntil(3)
at the start of this tutorial, to make sure we have at least 3 VD

more below, look at the hotkeys in code.
)
gui, add, Edit, -vscroll -E0x200 +hwndHWndExplanation_Edit, % explanation ; https://www.autohotkey.com/boards/viewtopic.php?t=3956#p21359
;deselect edit text BY moving caret to start

;END of gui stuff
;include the library
#Include VD.ahk

; or
; #Include %A_LineFile%\..\_VD.ahk
; ...{startup code}
; VD.init()2

; VD.ahk : calls `VD.init()` on #Include
; _VD.ahk : `VD.init()` when you want, like after a GUI has rendered, for startup performance reasons


;you should WinHide invisible programs that have a window.
WinHide, % "Malwarebytes Tray Application"
;#SETUP END

; VD.createUntil(8)

; >#1::VD.goToDesktopNum(1)
; >#2::VD.goToDesktopNum(2)
; >#3::VD.goToDesktopNum(3)
; >#4::VD.goToDesktopNum(4)
; >#q::VD.goToDesktopNum(5)
; >#w::VD.goToDesktopNum(6)
; >#e::VD.goToDesktopNum(7)
; >#r::VD.goToDesktopNum(8)

; >#+1::VD.MoveWindowToDesktopNum("A",1)
; >#+2::VD.MoveWindowToDesktopNum("A",2)
; >#+3::VD.MoveWindowToDesktopNum("A",3)
; >#+4::VD.MoveWindowToDesktopNum("A",4)
; >#+q::VD.MoveWindowToDesktopNum("A",5)
; >#+w::VD.MoveWindowToDesktopNum("A",6)
; >#+e::VD.MoveWindowToDesktopNum("A",7)
; >#+r::VD.MoveWindowToDesktopNum("A",8)

; >#<!1::VD.MoveWindowToDesktopNum("A",1), VD.goToDesktopNum(1)
; >#<!2::VD.MoveWindowToDesktopNum("A",2), VD.goToDesktopNum(2)
; >#<!3::VD.MoveWindowToDesktopNum("A",3), VD.goToDesktopNum(3)
; >#<!4::VD.MoveWindowToDesktopNum("A",4), VD.goToDesktopNum(4)
; >#<!q::VD.MoveWindowToDesktopNum("A",5), VD.goToDesktopNum(5)
; >#<!w::VD.MoveWindowToDesktopNum("A",6), VD.goToDesktopNum(6)
; >#<!e::VD.MoveWindowToDesktopNum("A",7), VD.goToDesktopNum(7)
; >#<!r::VD.MoveWindowToDesktopNum("A",8), VD.goToDesktopNum(8)
