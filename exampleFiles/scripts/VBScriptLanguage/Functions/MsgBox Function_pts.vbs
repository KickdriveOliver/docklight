' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: MsgBox Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 44927

'Example MsgBox 

Dim MyVar

DL.ClearCommWindows
MyVar = MsgBox ("Hello World!", 65, "MsgBox Example")
DL.AddComment MyVar 
