' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: IsNull Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 7119

'Example IsNull

Dim MyVar, MyCheck
MyCheck = IsNull(MyVar)   ' Returns False.
MyVar = Null   ' Assign Null.
MyCheck = IsNull(MyVar)   ' Returns True.
MyVar = Empty   ' Assign Empty.
MyCheck = IsNull(MyVar)   ' Returns False.
