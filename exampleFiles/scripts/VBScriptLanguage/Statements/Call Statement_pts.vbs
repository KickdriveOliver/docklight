' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Call Statement.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 54310

'Example Call Statement

Call MyFunction("Hello World")
Function MyFunction(text)
   DL.AddComment text
End Function
