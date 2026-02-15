' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Docklight_ODBC_example.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 4119

' Docklight ODBC example
' Date: 2020-04-16 / Author: Heggelbacher
' Preconditions: 
' - ODBC user data source 32 Bit is set up, using DSN name "weighting".
' - Docklight VBScript "Safe Subset" is disabled via Docklight_Tweak.exe.
' See documentation Docklight_ODBC_example.pdf!
'
' Usage: 
' Use menu Scripting -> Run Script (Shift + F5) to start example

#include "adovbs.pts"

' Open connection to our example ODBC data connection "weighting"
Set conn = CreateObject("ADODB.Connection")
conn.Open "DSN=weighting"
' Accesss to the "Demo" record:
set rs = CreateObject("ADODB.Recordset")
With rs 
	' open new recordset, read/write, random positioning
    .ActiveConnection = conn
	.CursorLocation = adUseClient
    .CursorType = adOpenDynamic
    .LockType = adLockOptimistic
    .Source = "SELECT * FROM Demo"
    .Open
	
	' read values from the last record available
	.MoveLast
	lastId = .Fields("ID")
	lastCounter = .Fields("Counter")
	
	' append new record, use next ID and counter value
    .AddNew
	.Fields("ID") = lastID + 1
	.Fields("Counter") = lastCounter + 1
	.Fields("DateTime") = Now
	.Fields("Truck") = 10
	.Fields("w1_kg") = 20040
	.Fields("Jobnr") = "9999"
	.Fields("w2_B_kg") = 16527
	.Fields("w1-w2_kg") = 32754
    .Update	
	
	' Now display the full contents
	.MoveFirst
	Set objFields = .Fields
	Do While not .EOF
		DL.AddComment "======================"
		For i = 0 To (objFields.Count - 1)  
		DL.AddComment "rs(" & Chr(34) & objFields.Item(i).Name & Chr(34) &") = " & Chr(34) & objFields.Item(i) & Chr(34)
		Next
		.MoveNext
	Loop
End With

conn.Close
