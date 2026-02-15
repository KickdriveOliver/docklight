' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: UBound Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 5128

'Example UBound Function

Dim A(100,3,4)

DL.ClearCommWindows

DL.AddComment UBound(A,1)
DL.AddComment vbCrLf
DL.AddComment UBound(A,2)
DL.AddComment vbCrLf
DL.AddComment UBound(A,3)
DL.AddComment vbCrLf
