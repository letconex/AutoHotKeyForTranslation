^+NumpadSub:: ; Lowercase
bak = %clipboard%
Send, ^c
StringLower, clipboard, clipboard
Send, ^v
clipboard = %bak%
return

^+NumpadAdd:: ; Uppercase
bak = %clipboard%
Send, ^c
StringUpper, clipboard, clipboard
Send, ^v
clipboard = %bak%
return

^+NumpadMult:: ; Title case
bak = %clipboard%
Send, ^c
StringUpper, clipboard, clipboard, T
Send, ^v
clipboard = %bak%
return
