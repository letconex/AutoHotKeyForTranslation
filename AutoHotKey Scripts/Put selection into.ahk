^Numpad0:: ; Ctrl+Numpad0, put selection into columns
ClipSaved := Clipboardall ; save clipboard contents
Send ^x
Clipwait
selection := Clipboard
Send, `„%selection%`“ ; send clipboard content with your characters around it
Sleep, 300
clipboard := ClipSaved ; restore clipboard
Return

^Numpad1:: ; Win+B, put selection into paratheses
saved := clipboardall ; save clipboard contents
Send, ^x
Clipwait
Send, (%clipboard%) ; send clipboard content with your characters around it
clipboard := saved ; restore clipboard
saved := "" ; clear saved
Return

^Numpad2:: ; Win+B, put selection into square brackets
saved := clipboardall ; save clipboard contents
Send, ^x
Clipwait
Send, [%clipboard%] ; send clipboard content with your characters around it
clipboard := saved ; restore clipboard
saved := "" ; clear saved
Return

^Numpad3:: ; Win+B, put selection into square acolades
saved := clipboardall ; save clipboard contents
Send, ^x
Clipwait
SendRaw {%clipboard%} ; send clipboard content with your characters around it
clipboard := saved ; restore clipboard
saved := "" ; clear saved
Return
