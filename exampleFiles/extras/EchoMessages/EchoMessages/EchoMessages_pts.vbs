' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: EchoMessages.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 20014

' EchoMessages.pts
' Docklight Sample Script - Echo all messages received
' Author: Heggelbacher
' Date: 2006-04-08
'
' This script is useful to simulate a loopback connector by software,
' allowing additional analyis, monitoring and data manipulation using 
' the Docklight functions.
'
' The data is echoed on a "per message" basis, rather than a "per character"
' way. The data is accumulated until there is a minimum pause time
' (MSG_PAUSE_MILLSEC). After the timeout, the accumulated data is sent out.
'
' Before sending out the HEX sequence in <msgCopy>, you can perform additional
' manipulations, e.g. introducing random errors.
'
 
' Minimum pause time between two messages
MSG_PAUSE_MILLSEC = 100

msgBuffer = ""
msgCopy = ""
msgLen = 0
msgCompleteTimer = Timer

DL.OpenProject"EchoMessages.ptp"
DL.StartCommunication()

Do
    DL.Pause 1 ' reduce CPU load
    If Len(msgBuffer) > 0 And Abs(Timer - msgCompleteTimer) * 1000 > MSG_PAUSE_MILLSEC Then
        ' Checking for len(msgBuffer) ensures we are not losing data
        ' if the DL_OnReceive() event is fired meanwhile and another byte
        ' is added
        msgLen = Len(msgBuffer)
	  msgCopy = Left(msgBuffer, msgLen)
	  msgBuffer = Mid(msgBuffer, msgLen + 1)
	  
	  ' TODO: Add your manipulation of the <msgCopy> hex sequence here

        DL.SendSequence "", msgCopy, "H"
    End If
Loop

Sub DL_OnReceive()
    If DL.OnReceive_GetName() = "AnyCharacter" Then
        msgBuffer = msgBuffer + DL.OnReceive_GetData("H") + " "
        msgCompleteTimer = Timer
    End If
End Sub

