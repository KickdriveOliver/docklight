' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Year Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 32451

'Example Year

Dim MyDate
MyDate = #December 7, 1968#   ' Assign a date.

DL.ClearCommWindows
DL.AddComment Year(MyDate) 
