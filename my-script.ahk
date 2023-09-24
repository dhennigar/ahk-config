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

DetectHiddenWindows True

;; Maps capslock to control, then regain capslock functionality
;; by pressing both shift keys.

Capslock::Ctrl
+LShift::Capslock
+RShift::Capslock

;; useful on the model m
F12::LWin
^F12::F12


;; C-g == esc outside of emacs
#HotIf !WinActive("ahk_class Emacs")
^g::Esc
#HotIf


;; emacs-style navigation in chrome
#HotIf WinActive("ahk_exe chrome.exe") 
^s::Send "^f"
^n::Send "{Down}"
^p::Send "{Up}"
^f::Send "{Right}"
^b::Send "{Left}"
^v::Send "{PgDn}"
!v::Send "{PgUp}"
#HotIf


;; Run-or-raise
RunOrRaise(identifier, exe) {
	if WinExist(identifier)
		WinActivate
	else
		Run exe
}
^!q::RunOrRaise "ahk_class qgis-ltr-bin.exe", "C:\Program Files\QGIS 3.28.10\bin\qgis-ltr-bin.exe"

^!w::RunOrRaise "ahk_exe chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe"

^!e::RunOrRaise "ahk_class Emacs", "C:\Program Files\Emacs\emacs-29.1\bin\runemacs.exe --chdir C:\Users\dhenn"

^!t::RunOrRaise "ahk_exe WindowsTerminal.exe", "wt.exe"



;;; my-script.ahk ends here