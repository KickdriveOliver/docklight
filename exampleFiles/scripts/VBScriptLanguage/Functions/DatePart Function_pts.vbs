' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: DatePart Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 29976

'Example DatePart Function

MyDate = "December 7, 1968"   ' Define date.
MyShortDate = CDate(MyDate)   ' Convert to Date data type.

PartOfDate = DatePart("w", MyShortDate)

Select Case PartOfDate 
      Case vbSunday 	TheDay = "Sunday"   
	Case vbMonday 	TheDay = "Monday"  
	Case vbTuesday 	TheDay = "Tuesday"  
	Case vbWednesday 	TheDay = "Wednesday"  
	Case vbThursday 	TheDay = "Thursday"  
	Case vbFriday 	TheDay = "Friday"  
	Case vbSaturday 	TheDay = "Saturday"  
End Select

DL.ClearCommWindows
DL.AddComment TheDay 
