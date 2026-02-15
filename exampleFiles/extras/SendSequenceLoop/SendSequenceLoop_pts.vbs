' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: SendSequenceLoop.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 60465

' SendSequenceLoop.pts
' How to send all Send Sequences in a loop
'
' Date: 2012-07-20
' Author: Heggelbacher
'
' Preconditions: 
' A Docklight project file (.ptp) with at least one Send Sequence
' definition is loaded

DL.ClearCommWindows

If DL.NoOfSendSequences = 0 Then 
	DL.AddComment "Please open a Docklight project or define at least one Send Sequence!"
Else
	pauseMSec = InputBox("Enter pause time between Send Sequences [msec]", "SendSequenceLoop", 1000) 
	sendRound = 0
	Do 
		sendRound = sendRound + 1
		DL.AddComment 
		DL.AddComment
		DL.AddComment "Sending all sequences, round = " & sendRound 
		For i = 0 To (DL.NoOfSendSequences - 1)
			DL.SendSequence i
			If pauseMSec > 0 Then DL.Pause pauseMSec
		Next
	Loop
End If
