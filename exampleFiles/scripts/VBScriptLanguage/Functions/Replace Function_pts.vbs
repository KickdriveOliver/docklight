' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Replace Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 23219

'Example Replace Function 

Dim MyString

DL.ClearCommWindows

DL.AddComment Replace("XXpXXPXXp", "p", "Y")   
' A binary comparison starting at the beginning of the string. 
' Returns "XXYXXPXXY".

DL.AddComment vbCrLf
 
DL.AddComment Replace("XXpXXPXXp", "p", "Y", 3, -1, 1)
' A textual comparison starting at position 3. 
' Returns "YXXYXXY".  

DL.AddComment vbCrLf
