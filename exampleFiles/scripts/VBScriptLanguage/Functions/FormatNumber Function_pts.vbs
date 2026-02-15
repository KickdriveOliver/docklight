' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: FormatNumber Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 7102

' Example FormatNumber Function

DL.ClearCommWindows

MyAngle = 1.3   ' Define angle in radians.
MySecant = 1 / Cos(MyAngle)   ' Calculate secant.
DL.AddComment "4 decimal places: FormatNumber(MySecant, 4) = " & FormatNumber(MySecant, 4) 
DL.AddComment "leading zero, 1 decimal place: FormatNumber(0.123, 1, -1) = " & FormatNumber(0.123, 1, -1)
DL.AddComment "no zero, 3 decimal places: FormatNumber(0.123, 3, 0) = " & FormatNumber(0.123, 3, 0)
DL.AddComment "negative value in brackets: FormatNumber(-MySecant, 2, , -1) = " &  FormatNumber(-MySecant, 2, , -1)
DL.AddComment "no brackets, no number groups, default decimals: FormatNumber(-1000000, , , 0, 0) = " & FormatNumber(-1000000, , , 0, 0)
DL.AddComment "use brackets and number groups, no decimals: FormatNumber(-1000000, 0, , -1, -1) = " & FormatNumber(-1000000, 0, , -1, -1)
