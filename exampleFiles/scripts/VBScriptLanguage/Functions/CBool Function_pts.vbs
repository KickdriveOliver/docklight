' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: CBool Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 14631

'Example CBool Function

Dim A, B, Check
A = 5: B = 5           ' Initialize variables.
Check = CBool(A = B)   ' Check contains True.
A = 0                  ' Define variable.
Check = CBool(A)       ' Check contains False.
