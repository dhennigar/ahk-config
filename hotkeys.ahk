;;; hotkeys.ahk --- my autohotkey configuration file

#Requires AutoHotkey v2.0
#SingleInstance

DetectHiddenWindows True

Emacs := "C:\Program Files\Emacs\emacs-29.1\bin\runemacs.exe --chdir C:\Users\dhenn"
Browser := "C:\Program Files\Google\Chrome\Application\chrome.exe"

RunOrRaise(identifier, exe) {
  if WinExist(identifier)
    WinActivate
  else
    Run exe
}

Capslock::Ctrl
+LShift::Capslock
+RShift::Capslock

^!t::Run "wt.exe"
^!e::Run Emacs
^!w::Run Browser

;^q::{
;  ih := InputHook("L1 M")
;  ih.Start()
;  ih.Wait()
;
;  Switch ih.Input, True {
;	  Case "t":
;	  Run "wt.exe"
;	  Case "e":
;	  RunOrRaise "ahk_class Emacs", Emacs
;	  Case "w":
;	  RunOrRaise "ahk_exe chrome.exe", Browser
;	  Case Chr(3):
;	  Send "{LAlt down}{F4}{LAlt up}"
;	  Case "r":
;	  MsgBox "Reloading AHK Config."
;	  Reload
;         Default:
;	  Return
;  }
;}

#HotIf !WinActive("ahk_class Emacs")
^g::Esc
#HotIf
