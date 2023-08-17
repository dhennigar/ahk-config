;;; my-script.ahk --- Daniel's AutoHotkey configuration file

#Requires AutoHotkey v2.0
#SingleInstance

;; Map capslock to control, then regain capslock functionality
;; by pressing both shift keys.

Capslock::Ctrl
+LShift::Capslock
+RShift::Capslock

;; Tapping the Tab key acts as normal. Holding down Tab in
;; combination with another key acts as an Alt key.

Tab::Send "{LAlt Down}"
Tab Up::{
	if (A_PriorKey = "Tab") {
		Send "{LAlt Up}"
		Send "{Tab}"
	} else {
		Send "{LAlt Up}"
	}
}

;; Map the little-used F12 key to Windows. This is needed for
;; my win-keyless IBM Model M. Ctrl+F12 regains the F12 key.

F12::LWin
^F12::Send "{F12}"