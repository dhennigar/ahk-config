;;; my-script.ahk --- Daniel's AutoHotkey configuration file

;;; Commentary:

;; These keybindings are meant to be OS-agnostic - easily transferrable
;; to a Linux desktop for example. The philosophy is that I use very few
;; applications in practice and I want to either start them or jump to them
;; quickly with the same key presses. I don't want to memorize keybindings,
;; I just want to get work done.

;;; Code:

#Requires AutoHotkey v2.0
#SingleInstance


;; Maps capslock to control, then regain capslock functionality
;; by pressing both shift keys.

Capslock::Ctrl
+LShift::Capslock
+RShift::Capslock


;; Maps the little-used F12 key to the Windows key. This is 
;; needed for my win-keyless IBM Model M. Ctrl+F12 regains 
;; the F12 key.

F12::LWin
^F12::F12


;; Maps C-g to Escape when outside of Emacs.

#HotIf !WinActive("ahk_class Emacs")
^g::Esc
#HotIf


;; Emacs bindings in Chrome.

#HotIf WinActive("ahk_exe chrome.exe") 
^s::Send "^f"
^n::Send "{Down}"
^p::Send "{Up}"
#HotIf


;; The following hotkeys focus the given application if it is already
;; open. Else, they launch a new instance of the application.

RunOrRaise(identifier, exe)
{
	if WinExist(identifier)
		WinActivate
	else
		Run exe
}

^!e::RunOrRaise "ahk_class Emacs", "C:\Program Files\Emacs\emacs-29.1\bin\runemacs.exe"

^!w::RunOrRaise "ahk_exe chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe"

^!t::RunOrRaise "ahk_exe WindowsTerminal.exe", "wt.exe"


;;; my-script.ahk ends here