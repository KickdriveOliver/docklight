' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: IsNumeric Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 10649

'Example IsNumeric

Dim MyVar, MyCheck
MyVar = 53   ' Assign a value.
MyCheck = IsNumeric(MyVar)   ' Returns True.
MyVar = "459.95"   ' Assign a value.
MyCheck = IsNumeric(MyVar)   ' Returns True.
MyVar = "45 Help"   ' Assign a value.
MyCheck = IsNumeric(MyVar)   ' Returns False.
