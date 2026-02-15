' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Eval Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 59109

'Example Eval Function

If Eval("DL.NoOfSendSequences > 0") Then
	MsgBox "There are defined Send Sequences"
Else
	MsgBox  "No Send Sequences defined!"
End If
