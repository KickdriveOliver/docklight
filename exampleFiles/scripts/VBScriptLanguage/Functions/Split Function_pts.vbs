' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Split Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 49063

'Example Split Function

Dim MyArray 

DL.ClearCommWindows

MyArray = Split("Flachmann und Heggelbacher", " ", -1, 1)

For i = 0 To UBound (MyArray)

	DL.AddComment MyArray(i)
	DL.AddComment vbCrLf
Next


