' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Select Case Statement.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 33815

'Example Select Case Statement

   Select Case Weekday(now)
      Case 1     DL.addComment"Sunday"
      Case 2     DL.addComment"Monday"
      Case 3     DL.addComment"Tuesday"
      Case 4     DL.addComment"Wednesday"
      Case 5     DL.addComment"Thursday"
      Case 6     DL.addComment"Friday"
      Case 7     DL.addComment"Saturday"
	Case Else  DL.addComment"not defined" 
   End Select
