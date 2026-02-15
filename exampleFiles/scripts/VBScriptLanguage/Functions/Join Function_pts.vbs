' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Join Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 43694

'Example Join

Dim MyString
Dim MyArray(3)
MyArray(0) = "Flachmann"
MyArray(1) = " und"
MyArray(2) = " Heggelbacher"
MyArray(3) = " 2004"

DL.ClearCommWindows
DL.AddComment Join(MyArray)
