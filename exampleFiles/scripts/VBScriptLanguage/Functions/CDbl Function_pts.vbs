' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: CDbl Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 35136

'Example CDbl Function

Dim MyCurr, MyDouble
MyCurr = CCur(234.456784)              ' MyCurr is a Currency (234.4567).
MyDouble = CDbl(MyCurr * 8.2 * 0.01)   ' Convert result to a Double (19.2254576).
