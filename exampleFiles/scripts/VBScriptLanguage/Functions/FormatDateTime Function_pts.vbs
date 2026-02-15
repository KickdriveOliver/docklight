' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: FormatDateTime Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 37743

' Example FormatDateTime Function

DL.ClearCommWindows

DL.AddComment FormatDateTime(now, vbGeneralDate) & vbCrLf
DL.AddComment FormatDateTime(now, vbLongDate) & vbCrLf
DL.AddComment FormatDateTime(now, vbShortDate) & vbCrLf
DL.AddComment FormatDateTime(now, vbLongTime) & vbCrLf
DL.AddComment FormatDateTime(now, vbShortTime) & vbCrLf
