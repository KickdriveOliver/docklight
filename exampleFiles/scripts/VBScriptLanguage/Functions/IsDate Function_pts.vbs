' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: IsDate Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 40557

'Example IsDate


Dim MyDate, YourDate, NoDate, MyCheck
MyDate = "October 19, 1962": YourDate = #10/19/62#: NoDate = "Hello"
MyCheck = IsDate(MyDate)   ' Returns True.
MyCheck = IsDate(YourDate)   ' Returns True.
MyCheck = IsDate(NoDate)   ' Returns False.
