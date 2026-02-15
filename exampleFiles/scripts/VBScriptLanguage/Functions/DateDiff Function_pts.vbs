' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: DateDiff Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 16487

'Example DateDiff Function

MyDate = "December 7, 1968"   ' Define date.
MyShortDate = CDate(MyDate)   ' Convert to Date data type.

DiffADate = "Days from today: " & DateDiff("d", Now, MyShortDate )

DL.ClearCommWindows
DL.AddComment DiffADate
