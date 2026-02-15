' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: XenaxDocklightTestPcMovePq_auto.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 47379

debugMode = false

xChannel = "192.168.2.101:10001"
zChannel = "192.168.2.100:10001"

if debugMode THEN  
	xChannel = "localhost:10001"
	zChannel = "localhost:10002"
End if

tpsr = 0 ' global variable for status word
currentAxisChannel = 1 ' global variale for current DL.DirectSend channel

DL.ClearCommWindows

' x axis init & open TCP
DL.StopCommunication
DL.SetChannelSettings xChannel, 1, True
DL.StartCommunication

' z axis init & open TCP
DL.OpenSideChannel zChannel, 3, "" ' no channel tag. Cannot distinguish Z axis RX responses

' DEBUG EXTRA POSITION
' TestMe "z", 32768

Do
    TestMe "x", 3000
    TestMe "z", 32768
    TestMe "x", -3000
    TestMe "x", 3000
    TestMe "z", -32768
    TestMe "x", -3000
Loop

Sub TestMe(axis, position)
    waitForMoveEnd = True
    ' DEBUG waitForMoveEnd = (axis <> "x")

    SelectAxis(axis)
    SendXenaxCmd "PWC"
 
    SendXenaxCmd "G" & CStr(position)
    If waitForMoveEnd then waitMoveStopped
    
    SendXenaxCmd "PQ"
End Sub


Sub SelectAxis(axis)
    DL.AddComment
    DL.AddComment
    If LCase(axis) = "x" Then 
		currentAxisChannel=1 
		DL.AddComment "SELECT AXIS X TCP=" & xChannel
	Else 
		currentAxisChannel=3
		DL.AddComment "SELECT AXIS Z TCP=" & zChannel
	End If
End Sub

Sub waitMoveStopped()
	timeoutCount = 0
	hasTimeout = false
	tpsr = 0 
	Do 
		SendXenaxCmd "TPSR"
		DL.Pause 5
		timeoutCount = timeoutCount + 1
		hasTimeout = timeoutCount >= 40
		' repeat until IN_MOTION=1
	Loop until ((tpsr AND (2^2)) > 0) Or hasTimeout Or debugMode
	DL.AddComment
	if hasTimeout then 
		DL.AddComment "XENAX TPSR wait for IN_MOTION timeout. Maybe already in position."
	else
		DL.AddComment "XENAX TPSR says: IN_MOTION"
	end if
	Do 
		SendXenaxCmd "TPSR"
		DL.Pause 5
		' repeat until IN_MOTION=0, IN_POSITION=1
	Loop until ((tpsr AND (2^2)) = 0) and  ((tpsr AND (2^3)) > 0)
	DL.AddComment
	DL.AddComment "XENAX TPSR says: IN_POSITION, not in_motion"
End Sub

Sub SendXenaxCmd(cmd)
	DL.AddComment
	DL.AddComment DL.GetDocklightTimeStamp() & "[to xenax] " & cmd
	DL.DirectSend currentAxisChannel, cmd + vbCr, "A"
    	DL.WaitForSequence "Prompt >"
	DL.ResetReceiveCounter	
End Sub

Sub DL_OnReceive()
	If DL.OnReceive_GetName() = "TPSR Result" Then
		tpsr = CLng("&H" + DL.OnReceive_GetData("A", 7, -3))
	End If
End Sub
