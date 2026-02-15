' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Agilent_HP34401_SIMULATOR_auto.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 27751

DL.StartCommunication
Do 
	DL.Pause 1 ' reduce CPU load
Loop

Sub DL_OnSend()
	' Randomize the measurement readings
	If DL.OnSend_GetName() = "SimResultVariable" Then
		If Rnd > 0.5 Then DL.OnSend_Poke 1, Asc("-")
		DL.OnSend_Poke 2, (48 + Rnd * 9)
		DL.OnSend_Poke 4, (48 + Rnd * 9)
		DL.OnSend_Poke 5, (48 + Rnd * 9)
		DL.OnSend_Poke 6, (48 + Rnd * 9)
	End If
End Sub
