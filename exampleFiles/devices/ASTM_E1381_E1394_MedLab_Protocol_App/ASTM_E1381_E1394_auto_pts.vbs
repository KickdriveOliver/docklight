' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: ASTM_E1381_E1394_auto.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 61296

' ASTM Example
' See "ASTM_E1381_E1394.ptp" project file for documentation
' Date: 2020-04-14
' Author: Heggelbacher

outputFileNameStart = "IMPORT_"
useTimestampForOutput = True

DL.ClearCommWindows
DL.StartCommunication
Debug.Mode = 0

payloadList = ""
frameNo = 0
transferPhase = False
receivePhase = False
receiveFrameData = ""
outputStartTime = 0
currentOutputFile = ""
Do
    DL.Pause 1 ' reduce CPU load
    ' still frames to send?
    frameSepPos = InStr(payloadList, Chr(13) + Chr(10))
    If frameSepPos > 0 Then
        If Not transferPhase Then
            ' switch to transfer phase first
            DL.ResetReceiveCounter
            DL.SendSequence "ENQ"
            transferPhase = (DL.WaitForSequence("ACK", 1, 15000) > 0)
        End If
        If transferPhase Then
           frameNo = (frameNo + 1) Mod 8
           ' take next part
           nextFrame = Chr(48 + frameNo) + Left(payloadList, frameSepPos - 1)
           Debug.PrintMsg "nextFrame  = " & nextFrame
           payloadList = Mid(payloadList, frameSepPos + 2)
           DL.ResetReceiveCounter
           Do
               DL.SendSequence "Frame", DL.ConvertSequenceData("fromText", nextFrame), "H"  ' see second use of DL.ConvertSequenceData
               DL.WaitForSequence "ACK", 1, 15000
               ' repeat if the ACK wasn't received
           Loop Until (DL.GetReceiveCounter("ACK") > 0)
        End If
    Else
        ' no more frames? End transfer phase
        If transferPhase Then
            DL.SendSequence "EOT"
            transferPhase = False
        End If
    End If
Loop

Sub DL_OnSend()
    If DL.OnSend_GetName() = "TransferFile" Then
        fileToTransfer = DL.OnSend_GetData("A")
        ' setting the data to nothing prevents the original unformatted text to be sent
        DL.OnSend_SetData "", "A"
        FileInput.OpenFile fileToTransfer
        Do Until FileInput.EndOfFile
         ' passing data as HEX is necessary, because regular spaces are a parameter separator in ASCII for Send Sequence arguments
            DL.SendSequence "TextData", DL.ConvertSequenceData("fromText", FileInput.GetLine()), "H"
        Loop
        FileInput.CloseFile
    ElseIf DL.OnSend_GetName() = "TextData" Then
        ' TextData is a standard line of text, usually terminated by <CR>.
        ' The below code does the "framing" (STX, ETX and checksum magic), according to ASTM
        payloadData = DL.OnSend_GetData("A")
        Debug.PrintMsg "Payload Data = " & payloadData
        DL.OnSend_SetData "", "A"
        ' make sure a CR is really send as carriage return, and not 4 printing letters "<CR>"
        payloadData = Replace(payloadData, "<CR>", Chr(13))
        payloadLines = Split(payloadData, Chr(13))
        For Each pLine In payloadLines
            If Len(pLine) > 0 Then
                Debug.PrintMsg "Payload Line  = " & pLine
                pLine = pLine + Chr(13)
                While Len(pLine) > 0
                ' each frame can only hold 240 bytes of payload data
                    payloadList = payloadList + Left(pLine, 240)
                    pLine = Mid(pLine, 241)
                    If (pLine = "") Then
                         payloadList = payloadList & Chr(3) ' ETX (last frame)
                    Else
                        payloadList = payloadList & Chr(17) ' ETB (intermediate frame, more to come)
                    End If
                    ' plus extra <CR><LF> to separate things
                    payloadList = payloadList & Chr(13) & Chr(10)
                Wend
             End If
        Next
    End If
End Sub

Sub DL_OnReceive()
    If DL.OnReceive_GetName() = "ENQ" And Not receivePhase Then
        ' Awake for incoming transfer
        receivePhase = True
        currentOutputFile = fileNameWithDateTime()
        FileOutput.CreateFile currentOutputFile, False, True ' appendData = True, don't overwrite existing file
        outputStartTime = -1
    ElseIf receivePhase And DL.OnReceive_GetName() = "EOT" Then
        ' transmission ended
        receivePhase = False
        FileOutput.CloseFile
    ElseIf DL.OnReceive_GetName() = "FrameETX Checksum OK" Then
        ' last frame. Write collected output frame to file
        receiveFrameData = receiveFrameData + DL.OnReceive_GetData("A", 3, -6)
        ' Is this a message header and we are not in receivePhase yet (no ENQ received)
        If Left(receiveFrameData, 2) = "H|" And Not receivePhase Then
            ' start receive phase now
            receivePhase = True
            currentOutputFile = fileNameWithDateTime()
            FileOutput.CreateFile currentOutputFile, False, True ' appendData = True, don't overwrite existing file
            outputStartTime = Time
        End If
        If useTimestampForOutput Then
            ' prepend with time stamp
            timeDiff = 0
            If outputStartTime <> -1 Then
                timeDiff = CLng((Timer - outputStartTime) * 100) / 100
                If timeDiff < 0 Then timeDiff = timeDiff + 86400 ' consider midnight jump
            End If
            outputStartTime = Timer
            timestampStr = Replace(Left(CStr(timeDiff), 4), "0.", " .")
            receiveFrameData = Right("     " + timestampStr, 6) & " " & receiveFrameData
        End If
        FileOutput.WriteLine receiveFrameData
        ' Is this a message terminator?
        If (Left(receiveFrameData, 2) = "L|") Then
            ' make sure the output is written to file and the file is reopened
            FileOutput.CloseFile
            ' immediately re-open for appending
            FileOutput.CreateFile currentOutputFile, False, True
        End If
        receiveFrameData = ""
    ElseIf DL.OnReceive_GetName() = "FrameETB Checksum OK" Then
        ' intermediate frame. Just collect
        receiveFrameData = receiveFrameData + DL.OnReceive_GetData("A", 3, -6)
    End If
End Sub

Function fileNameWithDateTime()
    ' create a file name which includes the actual date and time
    startDate = Now
    fileNameWithDateTime = outputFileNameStart & Year(startDate) & "-" & Month(startDate) & "-" & Day(startDate) & "_" & Right("0" + CStr(Hour(startDate)), 2) & "-" & Right("0" + CStr(Minute(startDate)), 2) & ".DAT"
End Function


