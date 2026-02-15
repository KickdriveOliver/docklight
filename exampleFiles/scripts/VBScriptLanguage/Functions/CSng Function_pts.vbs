' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: CSng Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 39228

' Example : CSng Function 

Dim MyDouble1, MyDouble2, MySingle1, MySingle2   ' MyDouble1, MyDouble2 are Doubles.
MyDouble1 = 75.3421115: MyDouble2 = 75.3421555
MySingle1 = CSng(MyDouble1)   ' MySingle1 contains 75.34211.
MySingle2 = CSng(MyDouble2)   ' MySingle2 contains 75.34216.
