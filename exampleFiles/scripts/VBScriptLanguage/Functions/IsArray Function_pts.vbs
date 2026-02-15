' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: IsArray Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 249

'Example IsArray


Dim MyVariable
Dim MyArray(3)
MyArray(0) = "Sunday"
MyArray(1) = "Monday"
MyArray(2) = "Tuesday"
DL.AddComment IsArray(MyArray) ' returns "True".
