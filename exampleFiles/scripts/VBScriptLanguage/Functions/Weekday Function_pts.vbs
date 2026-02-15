' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Weekday Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 9185

'Example Weekday

Dim MyDate, MyWeekDay
MyDate = #December 7, 1968#   ' Assign a date.

DL.ClearCommWindows
DL.AddComment Weekday(MyDate) 
