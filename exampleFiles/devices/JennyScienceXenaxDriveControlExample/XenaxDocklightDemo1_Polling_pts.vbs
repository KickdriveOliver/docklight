' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: XenaxDocklightDemo1_Polling.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 39997

' XenaxDocklightDemo1_Polling.pts
' Precondition: XenaxDocklightDemo.ptp project file is loaded
'               (Menu File --> Open Project...)

tpsr = 0 ' global variable for status word
tpsr_ERROR = False
tpsr_REF = False
tpsr_IN_MOTION = False
tpsr_IN_POSITION = False
tpsr_IN_FORCE = False
tpsr_I_FORCE_LIMIT_REACHED = False
tpsr_WARNING = False

DL.ClearCommWindows
DL.StartCommunication

XenaxComment "Power-up and referencing ..."
SendXenaxCmd "EVT0"  ' no events please, we use TPSR polling
SendXenaxCmd "PWC"
SendXenaxCmd "REF"
waitReferenced

speed = 20000
acceleration = 400000

XenaxComment "Use jog positive / negative ..."

SendXenaxCmd "SP" & speed
SendXenaxCmd "AC" & acceleration
SendXenaxCmd "JP"
DL.Pause 1000
SendXenaxCmd "JN"
DL.Pause 1000
SendXenaxCmd "SM"
DL.Pause 1000
    
' Positioning
XenaxComment "Use Go Position ..."

Do
    DL.ResetReceiveCounter
    SendXenaxCmd "SP" & CStr(speed)
    SendXenaxCmd "AC" & CStr(acceleration)
    For position = 8000 To 28000 Step 10000
        SendXenaxCmd "G" & CStr(position)
        waitMoveStarted
        waitMoveStopped
        SendXenaxCmd "G1000"
        waitMoveStopped
    Next
    speed = speed * 2
    acceleration = acceleration * 2
Loop Until speed > 80000

' end test
SendXenaxCmd "PQ"
DL.Pause 1000
XenaxComment "Test complete."

' Helper functions for TPSR polling & processing

' This is for cases you need to confirm that the motor has actually started moving
' (and was not in position already)
Sub waitMoveStarted()
    timeoutCount = 0
    hasTimeout = False
    Do
        SendXenaxCmd "TPSR"
        DL.Pause 5
        timeoutCount = timeoutCount + 1
        hasTimeout = timeoutCount >= 5
    Loop Until tpsr_IN_MOTION Or hasTimeout
    If hasTimeout Then
        XenaxComment "'Wait for IN_MOTION' has timed out. Maybe already in position, or movement was very short."
    Else
        XenaxComment "IN_MOTION"
    End If
End Sub

Sub waitMoveStopped()
    Do
        SendXenaxCmd "TP"
        SendXenaxCmd "TPSR"
        DL.Pause 5
    Loop Until tpsr_IN_POSITION And Not (tpsr_IN_MOTION)
    XenaxComment "IN_POSITION and not(IN_MOTION)"
End Sub

Sub waitReferenced()
    Do
        SendXenaxCmd "TPSR"
        DL.Pause 5
    Loop Until tpsr_REF
    XenaxComment "Referencing complete"
End Sub

Sub SendXenaxCmd(cmd)
    ' send a XENAX command and wait for XENAX prompt answer.
    ' (Prompt means "ready to receive next command", not "finished previous command")
    DL.ResetReceiveCounter
    DL.SendSequence "", cmd & vbCr, "A"
    DL.WaitForSequence "Prompt >"
End Sub

Sub DL_OnReceive()
    ' detect TPSR answer and assign to the relevant global variables
    If DL.OnReceive_GetName() = "TPSR Result" Then
        tpsr = CLng("&H" + DL.OnReceive_GetData("A", 7, -3))
        tpsr_ERROR = (tpsr And (2 ^ 0)) > 0
        tpsr_REF = (tpsr And (2 ^ 1)) > 0
        tpsr_IN_MOTION = (tpsr And (2 ^ 2)) > 0
        tpsr_IN_POSITION = (tpsr And (2 ^ 3)) > 0
        tpsr_IN_FORCE = (tpsr And (2 ^ 5)) > 0
        tpsr_I_FORCE_LIMIT_REACHED = (tpsr And (2 ^ 15)) > 0
        tpsr_WARNING = (tpsr And (2 ^ 23)) > 0
    End If
End Sub

Sub XenaxComment(msg)
    DL.AddComment
    DL.AddComment
    DL.AddComment "XENAX info: " & msg
End Sub
