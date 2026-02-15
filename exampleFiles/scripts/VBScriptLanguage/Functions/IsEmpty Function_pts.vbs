' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: IsEmpty Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 35778

'Example IsEmpty

Dim MyVar, MyCheck
MyCheck = IsEmpty(MyVar)   ' Returns True.
MyVar = Null   ' Assign Null.
MyCheck = IsEmpty(MyVar)   ' Returns False.
MyVar = Empty   ' Assign Empty.
MyCheck = IsEmpty(MyVar)   ' Returns True.
