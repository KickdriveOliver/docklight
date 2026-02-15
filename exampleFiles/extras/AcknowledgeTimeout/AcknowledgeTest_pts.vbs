' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: AcknowledgeTest.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 28614

' Docklight Demo Script:
' Waiting for an acknowledge of each message sent by Docklight
' Report an error and stop the test, if a timeout occurred

DL.OpenProject "AcknowledgeTestPrj"

' Simple state machine for the simulator
Dim simState
Const SIMSTATE_IDLE = 0
Const SIMSTATE_WAIT_FOR_ACK = 1
simState = SIMSTATE_IDLE

' acknowledge timeout in milliseconds
Const ACK_TIMEOUT = 1000
actualTimer = Timer

' start simulator, open COM port
DL.StartCommunication

' main loop
running = True
While running
    Select Case simState
        Case SIMSTATE_WAIT_FOR_ACK
            ' Check for ACK timeout:
            ' correct midnight jump first (Timer contains the elapsed seconds since midnight)
            If Timer < actualTimer - 1000 Then actualTimer = actualTimer - 86400
            If Timer > actualTimer + (ACK_TIMEOUT / 1000) Then
		    simState = SIMSTATE_IDLE
		    DL.AddComment 
                 DL.AddComment "ACKNOWLEDGE TIMEOUT. TEST STOPPED"
		    DL.AddComment   
		    DL.StopCommunication
                running = False       
            End If
    End Select
    ' short pause to reduce CPU load
    DL.Pause 1
Wend

' Event procedure called before sending out a new message
Sub DL_OnSend()
    If DL.OnSend_GetName() <> "Acknowledge" Then
        ' After sending out a new message, wait for
        ' the ACK from the real device
        simState = SIMSTATE_WAIT_FOR_ACK
        actualTimer = Timer
    End If
End Sub

' Event procedure called after receiving a message
' from the device
Sub DL_OnReceive()
    ' Process ACK signals
    If DL.OnReceive_GetName() = "Acknowledge" Then
        If simState = SIMSTATE_WAIT_FOR_ACK Then
            simState = SIMSTATE_IDLE
        End If
    end if
End Sub
