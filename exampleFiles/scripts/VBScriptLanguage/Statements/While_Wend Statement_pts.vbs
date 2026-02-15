' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: While_Wend Statement.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 39760

'Example While..Wend Statement

Dim Counter
Counter = 0   ' Initialize variable.
While Counter < 20   ' Test value of Counter.
   Counter = Counter + 1   ' Increment Counter.
   DL.AddComment Counter
Wend   ' End While loop when Counter > 19.
