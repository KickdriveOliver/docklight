' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Asc Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 26540

' Example, Asc returns the ANSI character code 
' of the first letter of each string: 

Dim MyNumber
MyNumber = Asc("A")       ' Returns 65.
MyNumber = Asc("a")       ' Returns 97.
MyNumber = Asc("Apple")   ' Returns 65.
