' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: CByte Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 32759

'Example CByte Function

Dim MyDouble, MyByte
MyDouble = 125.5678        ' MyDouble is a Double.
MyByte = CByte(MyDouble)   ' MyByte contains 126.
