' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: InputBox Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 13183

' Example InputBox


Dim Input

DL.ClearCommWindows

Input = InputBox("Enter your name") 

DL.AddComment ("You entered: " & Input)
