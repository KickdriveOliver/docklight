' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Int Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 56583

' Example Int,Fix Function


MyNumber = Int(99.8)    ' Returns 99.
MyNumber = Fix(99.2)    ' Returns 99.
MyNumber = Int(-99.8)   ' Returns -100.
MyNumber = Fix(-99.8)   ' Returns -99.
MyNumber = Int(-99.2)   ' Returns -100.
MyNumber = Fix(-99.2)   ' Returns -99.
