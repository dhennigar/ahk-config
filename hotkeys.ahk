;;; hotkeys.ahk --- my autohotkey configuration file

;;; Commentary:

;; Daniel on Sep 30, 2023:
;; These keybindings are meant to be OS-agnostic - easily transferrable
;; to a Linux desktop for example. The philosophy is that I use very few
;; applications in practice and I want to either start them or jump to them
;; quickly with the same key presses. I don't want to memorize keybindings,
;; I just want to get work done.

;;; TODO:

;; - add komorebi commands under the C-q prefix (obviates need for whkd)

;;; Code:

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

^q::{
  ih := InputHook("L1 M")
  ih.Start()
  ih.Wait()

  Switch ih.Input, True{
    Case "t": ; launch a terminal
      Run "wt.exe"
    Case "e": ; launch emacs
      RunOrRaise "ahk_class Emacs", Emacs
    Case "w": ; launch a web browser
      RunOrRaise "ahk_exe chrome.exe", Browser
    Case Chr(3): ; close a window
      Send "{LAlt down}{F4}{LAlt up}"
    Default:
      Return
  }
}


;;; Emacs things outside of emacs

#HotIf !WinActive("ahk_class Emacs")
^g::Esc
#HotIf

#HotIf WinActive("ahk_exe chrome.exe") || WinActive("ahk_class Firefox")
^n::Send "{Down}"
^p::Send "{Up}"
#HotIf
