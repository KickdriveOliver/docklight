' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Erase Statement.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 702

'Example Erase Statement

Dim NumArray(9)
Dim DynamicArray()
ReDim DynamicArray(9)   ' Allocate storage space.
Erase NumArray   ' Each element is reinitialized.
Erase DynamicArray   ' Free memory used by array.
