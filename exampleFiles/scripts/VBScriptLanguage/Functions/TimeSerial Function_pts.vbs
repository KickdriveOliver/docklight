' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: TimeSerial Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 4579

'Example TimeSerial Function

DL.ClearCommWindows

DL.AddComment TimeSerial(12 - 6, -15, 0) 
' Returns 5:45:00 AM
