' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: XenaxProtocolEmulator_auto.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 2996

' XenaxProtocolEmulator_auto.pts
' provide dynamic answers for project XenaxProtocolEmulator.ptp

lastCmdWithArguments = ""
DL.StartCommunication()
Do
    DL.Pause 1 ' reduce CPU load
Loop

Sub DL_OnReceive()
    ' in case this sequence has a variable argument, store the argument and re-use for
    ' for sending out the answer (see DL_OnSend())
    receiveDefinition = DL.GetEnvironment("DOCKLIGHT_RECEIVESEQDEF:" + DL.OnReceive_GetName())
    If InStr(receiveDefinition, "##") > 0 Then
        lastCmdWithArguments = DL.OnReceive_GetData("A")
    Else
        lastCmdWithArguments = ""
    End If
End Sub

Sub DL_OnSend()
    If lastCmdWithArguments <> "" Then
    	DL.OnSend_SetData Replace(lastCmdWithArguments, "<CR>", vbCrLf + ">"), "A"
    	lastCmdWithArguments = ""
    End If
End Sub
