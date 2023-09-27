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

Capslock::Ctrl
+LShift::Capslock
+RShift::Capslock

F12::LWin
^F12::F12

#HotIf !WinActive("ahk_class Emacs")
^g::Esc
#HotIf

#HotIf WinActive("ahk_exe chrome.exe") 
^s::Send "^f"
^n::Send "{Down}"
^p::Send "{Up}"
#HotIf

RunOrRaise(identifier, exe) {
	if WinExist(identifier)
		WinActivate
	else
		Run exe
}

^q::{
	ih := InputHook("L1 M")
	ih.Start()
	ih.Wait()

        ; Windows Terminal
	if (ih.Input = "t") {
              RunOrRaise "ahk_exe WindowsTerminal.exe", "wt.exe"
	}

        ; Emacs
	if (ih.Input = "e") {
              RunOrRaise "ahk_class Emacs", "C:\Program Files\emacs-29.1\bin\runemacs.exe --chdir C:\Users\dhenn"
	}

        ; Web browser
	if (ih.Input = "w") {
              RunOrRaise "ahk_exe chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe"
	}

        ; C-c
	if (ih.Input = Chr(3)) {
              Send "{LAlt down}{F4}{LAlt up}"
	}
}

;;; my-script.ahk ends here