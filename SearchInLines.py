# python SearchInLines.py "enro europarl v7.txt" justific & type result.txt
# cmd.exe /c cd "F:\!Ahk" & python "F:\!Ahk\SearchInLines.py" "F:\S\Dics\Editabil\GeRo\Dicgeneraldero.txt" "%GDWORD%" & type "F:\!Ahk\result.txt"
#encoding: utf-8
from __future__ import print_function
import sys
import os

if os.path.isfile("result.txt"):
        os.remove("result.txt")
with open(sys.argv[1], encoding='utf-8') as f:
    for line in f:
        if sys.argv[2] in line:
#            line = line + "\r\n"
#            print(line.encode("utf-8").decode("utf-8"), end="")
            result = open('result.txt', 'a', encoding='utf-8')
            result.writelines(line + "<br>")
            result.close()