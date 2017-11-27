^!r::Reload ; Assign Alt-Ctr-R as a hotkey to restart the script.
; This is an attempt to provide a way to acces MMT from Windows using the Autohotkey scripting language. The script assumes you have a working curl.exe installed in the same directory as the script and that you can change the IP-address to suit your server setup.

#i::  ; Send Window-I to start script and translate. It translates the selected text with the help of MMT API and returns the translation by overwriting the selection. The script uses URLEncode.exe, which in turn needs .NET 3.5.
FileEncoding, utf-8
SendInput, ^c ; Control-C to copy selected text
Sleep, 300
ClipWait ; Wait for the clipboard to be populated.
searchtext = %clipboard% ; Assign variable
clipboard = ; clean clipboard
;RunWait, URLEncode.exe -e %searchtext% -o decoded.txt,, Hide ;Run URLEncode.exe with the set parameter
;FileRead, urlencodedtext, decoded.txt ;msgbox %searchtext%
;RunWait, curl.exe http://192.168.0.110:8045/translate?q=%urlencodedtext%&context=%urlencodedtext% -o MMTin.txt,, Hide ; Context
;RunWait, curl.exe http://192.168.0.110:8045/translate?q=%urlencodedtext% -o MMTin.txt,, Hide ; No context
;RunWait, wget64.exe "192.168.0.110:8045/translate?q=%searchtext%"&context=dero -O MMTin.txt,, Hide
RunWait, wget.exe "192.168.0.110:8045/translate?q=%searchtext%"&context=%searchtext% -O MMTin.txt,, Hide
Sleep, 300
FileRead, targetxt, MMTin.txt ;MsgBox %searchtext%
Sleep, 300
StringTrimLeft, targetxt, targetxt, 37 ; Trim left 37 chars from the server response
quotes := """,""" ; ;Search for "," where the translation ends
StringGetPos, pos1, targetxt, %quotes%     ; MsgBox %targetxt%
StringLen, length, targetxt
StringTrimRight, targetxt, targetxt, length - pos1       ;Trim only the received translation
;StringReplace, targetxt, targetxt, ș, ş, All ; If needed, replace some special Romanian chars
;StringReplace, targetxt, targetxt, Ș, Ş, All
;StringReplace, targetxt, targetxt, ț, ţ, All
;StringReplace, targetxt, targetxt, Ț, Ţ, All
Clipboard = %targetxt%
ClipWait
Send ^v
FileDelete, MMTin.txt
Reload
Return


#m:: ; Translate segment with ModernMT in MemoQ, Across, Trados Studio with Window-X
FileEncoding, utf-8
WinGetActiveTitle, Title
IfInString, Title, memoQ
{
Send ^+s
Sleep, 200
SendInput ^a
Sleep, 300
SendInput ^c
Clipwait
Send ^c
Sleep, 300
Clipwait
Sleep, 200
}
IfInString, Title, Across
{
Send !{PgDn}
Sleep, 200
SendInput ^a
Sleep, 300
}
IfInString, Title, Trados Studio
{
Send +{Ins}
Sleep, 200
SendInput ^a
Sleep, 300
}
SendInput ^c
Clipwait
;Send ^c
Sleep, 300
searchtext := clipboard
;RunWait, URLEncode.exe -e %searchtext% -o decoded.txt,, Hide ;Run URLEncode.exe with the set parameter
;FileRead, urlencodedtext, decoded.txt ;msgbox %searchtext%
;RunWait, curl.exe http://192.168.0.110:8045/translate?q=%urlencodedtext%&context=%urlencodedtext% -o MMTin.txt,, Hide ; Context
;RunWait, curl.exe http://192.168.0.110:8045/translate?q=%urlencodedtext% -o MMTin.txt,, Hide ; No context
;RunWait, wget64.exe "192.168.0.110:8045/translate?q=%searchtext%"&context=dero -O MMTin.txt,, Hide
;RunWait, wget64.exe "192.168.0.110:8045/translate?q=%searchtext%" -O MMTin.txt,, Hide ;no context
RunWait, wget.exe "192.168.0.110:8045/translate?q=%searchtext%"&context=%searchtext% -O MMTin.txt,, Hide
Sleep, 300
FileRead, targetxt, MMTin.txt ;MsgBox %searchtext%
StringTrimLeft, targetxt, targetxt, 37 ; Trim left 37 chars from the server response
quotes := """,""" ; ;Search for "," where the translation ends
StringGetPos, pos1, targetxt, %quotes%     ; MsgBox %targetxt%
StringLen, length, targetxt
StringTrimRight, targetxt, targetxt, length - pos1       ;Trim only the received translation
;StringReplace, targetxt, targetxt, ș, ş, All ; If needed, replace some special Romanian chars
;StringReplace, targetxt, targetxt, Ș, Ş, All
;StringReplace, targetxt, targetxt, ț, ţ, All
;StringReplace, targetxt, targetxt, Ț, Ţ, All
Clipboard = %targetxt%
;Clipwait
Send ^v
;FileDelete, MMTin.txt
Return
