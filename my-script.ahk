;;; my-script.ahk --- Daniel's AutoHotkey configuration file

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



