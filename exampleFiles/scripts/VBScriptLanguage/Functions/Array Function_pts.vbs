' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Array Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 51681

' Example : Array Function

Dim A

A = Array(10,20,30)
B = A(2)   ' B is now 30.

DL.AddComment B
