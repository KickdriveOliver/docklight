' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: CDate Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 12864

'Example CDate Function

MyDate = "December 7, 1968"   ' Define date.
MyShortDate = CDate(MyDate)   ' Convert to Date data type.

DL.AddComment MyShortDate & vbCrLf

MyTime = "16:00:00 PM"         ' Define time.
MyShortTime = CDate(MyTime)   ' Convert to Date data type.

DL.AddComment MyShortTime & vbCrLf
