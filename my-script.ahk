#Requires AutoHotkey v2.0

#SingleInstance
InstallMouseHook True

Capslock::Ctrl

LAlt::LWin

Tab::Send "{LAlt Down}"
Tab Up::{
	if (A_PriorKey = "Tab") {
		Send "{LAlt Up}"
		Send "{Tab}"
	} else {
		Send "{LAlt Up}"
	}
}


