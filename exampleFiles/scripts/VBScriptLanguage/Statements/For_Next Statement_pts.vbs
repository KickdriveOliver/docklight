' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: For_Next Statement.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 46127

'Example For..Next Statement

For I = 1 To 5
      For J = 1 To 4
            For K = 1 To 3
            	DL.AddComment I & " " & J & " " & K
            Next
      Next
Next
