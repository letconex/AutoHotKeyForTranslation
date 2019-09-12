; The program converts a tab delimited file or entries separated by enters to tmx. Input file must not contain more than 1 tab per row.
FileEncoding, utf-8
FileRead, content, %1% ; %1% = input file name
FileDelete %1%.backup
FileAppend, %content%, %1%.backup, utf-8 ; create a .backup file
StringReplace, content, content, %A_Tab%, `r`n, All ; Replace TABs in source with Enters
StringReplace, content, content, `<, `&lt`;, All ; Replace tags in source with code
StringReplace, content, content, `>, `&gt`;, All ; Replace tags in source with code
FileDelete %1%
FileAppend, %content%, %1%, utf-8
FileDelete, %1%.tmx
;StringReplace, searchtext, searchtext, +, %A_SPACE%, All
FileAppend,
(
<?xml version="1.0" encoding="UTF-8"?>
<tmx version="1.4">
<header creationtool="CSV2TMX" creationtoolversion="1" segtype="sentence" o-tmf="undefined" adminlang="en-EN" srclang="de-DE" datatype="undefined"></header><body>
), %1%.tmx, utf-8
Loop, Read, %1%
{
Lines = %A_Index%
} ;Msgbox "Number of lines = " %Lines%
Lines/=2 ; Divide number of lines ;Msgbox %Lines%
Linenumber := 1 ;Msgbox %Linenumber%
Loop, %Lines%
{
FileReadLine, Source, %1%, %Linenumber%
Linenumber := Linenumber + 1 ;Msgbox %Linenumber%
FileReadLine, Target, %1%, %Linenumber%
FileAppend,
(
<tu>
<tuv xml:lang="de-DE"><seg>%source%</seg></tuv>
<tuv xml:lang="ro-RO"><seg>%target%</seg></tuv>
</tu>

), %1%.tmx, utf-8
Linenumber := Linenumber + 1
}
FileAppend,
(
</body>
</tmx>
), %1%.tmx, utf-8
Return