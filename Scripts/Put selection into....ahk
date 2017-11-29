::g3:: ; Win+B, put selection into columns
ClipSaved := clipboard ; save clipboard contents
SendInput, ^c ; copy
SendInput, ^x ; cut
Clipwait
SendInput, „%clipboard%“ ; send clipboard content with your characters around it
Sleep, 300
clipboard := ClipSaved ; restore clipboard
saved := "" ; clear saved
Return

::p3:: ; Win+B, put selection into paratheses
saved := clipboardall ; save clipboard contents
Send, ^x ; cut
Clipwait
Send, (%clipboard%) ; send clipboard content with your characters around it
clipboard := saved ; restore clipboard
saved := "" ; clear saved
Return

::pp3:: ; Win+B, put selection into square brackets
saved := clipboardall ; save clipboard contents
Send, ^x ; cut
Clipwait
Send, [%clipboard%] ; send clipboard content with your characters around it
clipboard := saved ; restore clipboard
saved := "" ; clear saved
Return

::ac3:: ; Win+B, put selection into square acolades
saved := clipboardall ; save clipboard contents
Send, ^x ; cut
Clipwait
SendRaw {%clipboard%} ; send clipboard content with your characters around it
clipboard := saved ; restore clipboard
saved := "" ; clear saved
Return
