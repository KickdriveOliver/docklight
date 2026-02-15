' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: MyString Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 44152

'Example MyString Function

Dim MyString
MyString = String(5, "*")   	' Returns "*****".
MyString = String(5, 42)   	' Returns "*****".
MyString = String(10, "ABC")  ' Returns "AAAAAAAAAA".
