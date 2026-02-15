' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: TypeName Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 34510


'Example TypeName Function

Dim ArrayVar(4), MyType
NullVar = Null   ' Assign Null value.

DL.ClearCommWindows

DL.AddComment TypeName("VBScript")   ' Returns "String".
DL.AddComment vbCrLf
DL.AddComment TypeName(4)            ' Returns "Integer".
DL.AddComment vbCrLf
DL.AddComment TypeName(37.50)        ' Returns "Double".
DL.AddComment vbCrLf
DL.AddComment TypeName(NullVar)      ' Returns "Null".
DL.AddComment vbCrLf
DL.AddComment TypeName(ArrayVar)     ' Returns "Variant()".
DL.AddComment vbCrLf
