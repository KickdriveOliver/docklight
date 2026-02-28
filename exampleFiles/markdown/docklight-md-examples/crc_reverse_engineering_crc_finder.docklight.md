# DOCKLIGHT:

format-version: 1

' crc_reverse_engineering_crc_finder_auto.pts / crc_reverse_engineering_crc_finder.ptp
' Author: Oliver Heggelbacher
' Date: 2016-09-19
' Solves the following CRC reverse engineering puzzles:
' http://stackoverflow.com/questions/22219796
' http://stackoverflow.com/questions/29850992

This project demonstrates how to reverse-engineer the CRC algorithm for a data protocol where only example messages including the correct CRC value are known, but not the actual CRC algorithm to use.

Usage: 
- Press Start Communication (F5) and confirm the sample data to use for the CRC brute-force search. 

- after crcReverseEngineer() completes, the script runs in the endless Do ... Loop. If you then click on the Send button ("--->") of one of the predefined  "Send Sequences", the code in Sub DL_OnSend() gets called, which calculates the correct CRC, before sending out the actual message.

Example Communication output could look like this: 
 
 Finding CRC for test message (HEX): 10 13 08 20 03 01 11 25 00 00 00 00 E9 64
 Trying CRC spec : CRC:16,1021,FFFF,0000,No,No
 Trying CRC spec : CRC:16,8005,0000,0000,No,No
 Trying CRC spec : CRC:16,8005,FFFF,0000,No,No
 Trying CRC spec : CRC:16,1021,FFFF,FFFF,No,No
 Trying CRC spec : CRC:16,1021,0000,FFFF,No,No
 Trying CRC spec : CRC:16,1021,0000,0000,No,No
 Found it!
 Relevant sequence for checksum from startpos=3 to endpos=12
 08 20 03 01 11 25 00 00 00 00
 CRC spec:   CRC:16,1021,0000,0000,No,No
 CRC result: E9 64 (Integer = 59748)
 
 Use the Send button to send some predefined sequences...

19.09.2016 12:18:12.764 [TX] - 10 13 08 20 03 01 11 25 00 00 00 00 E9 64 
19.09.2016 12:18:12.768 [RX] - 10 13 08 20 03 01 11 25 00 00 00 00 E9 64 
19.09.2016 12:18:14.606 [TX] - 10 13 08 20 03 01 11 25 01 00 00 00 9F D0 
19.09.2016 12:18:14.610 [RX] - 10 13 08 20 03 01 11 25 01 00 00 00 9F D0 
19.09.2016 12:18:16.030 [TX] - 10 13 08 20 03 01 11 25 02 00 00 00 04 0C 
19.09.2016 12:18:16.034 [RX] - 10 13 08 20 03 01 11 25 02 00 00 00 04 0C 

Note how the original "stackoverflow 29850992 Seq1" only contain placeholders ("FF FF") at the end, and the DL_OnSend() code provides the actual checksum as seen in the original Stackoverflow post: 

10 13 08 20 03 01 11 25 00 00 00 00 E9 64

10 13 08 20 03 01 11 25 01 00 00 00 9F D0

10 13 08 20 03 01 11 25 02 00 00 00 04 0C

## DOCKLIGHT: Communication Settings

communication-mode: 0  # Send/Receive
communication-filter: 0  # Show all
channel1-setting: UDP:LOCALHOST:10001
channel2-setting: 192.168.2.101:10001
channel1-alias: 
channel2-alias: 

## DOCKLIGHT: Send Sequence List

### DOCKLIGHT: Send 0: stackoverflow 29850992 Seq1

data: 10 13 08 20 03 01 11 25 00 00 00 00 FF FF
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 1: stackoverflow 29850992 Seq2

data: 10 13 08 20 03 01 11 25 01 00 00 00 FF FF
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 2: stackoverflow 29850992 Seq3

data: 10 13 08 20 03 01 11 25 02 00 00 00 FF FF
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 3: stackoverflow 22219796 REQ=INI ( CRC=4255)

data: 52 45 51 3D 49 4E 49 0D 0A 1E
repeat-active: false
repeat-interval: 5
checksum: 

## DOCKLIGHT: Script

script-version: 1
script-autostart: true

```vbscript
' crc_reverse_engineering_crc_finder_auto.pts / crc_reverse_engineering_crc_finder.ptp
' Author: Oliver Heggelbacher
' Date: 2016-09-19
' Solves the following CRC reverse engineering puzzles:
' http://stackoverflow.com/questions/22219796
' http://stackoverflow.com/questions/29850992

DL.ClearCommWindows

' Stackoverflow http://stackoverflow.com/questions/22219796
' crcTestMessage = "06 1C 52 45 51 3D 49 4E 49 0D 0A 1E 43 52 43 3D 30 30 30 30 0D 0A 1D 10 9F"
' Stackoverflow http://stackoverflow.com/questions/29850992/
crcTestMessage = "10 13 08 20 03 01 11 25 00 00 00 00 E9 64"
' this is where the resulting spec is stored, for later use in Sub DL_OnSend()
cStart = 0
cEnd = 0
crcSpec = ""

crcReverseEngineer

DL.AddComment
DL.AddComment "Use the Send button to send some predefined sequences..."

' allow some manual send & checksum calculation later
Do
    DL.Pause 1
Loop


Sub DL_OnSend()
   ' Calc CRC from what we found out by using crcReverseEngineer() once
   chksumHex = DL.CalcChecksum(crcSpec, DL.OnSend_GetData("H"), "H", cStart, cEnd)
   ' use this for the last two character positions (high byte, low byte)
   highByte = cint("&h" + left(chksumHex, 2))
   lowByte = cint("&h" + right(chksumHex, 2))
   DL.OnSend_Poke -2, highByte
   DL.OnSend_Poke -1, lowByte
End Sub


Sub crcReverseEngineer()
    ' you can try with a different message
    crcTestMessage = InputBox("Use this HEX test message:", "crcReverseEngineer", crcTestMessage)
    DL.AddComment
    DL.AddComment "Finding CRC for test message (HEX): " & crcTestMessage

    Dim crctypes(7)
    
    crctypes(0) = "CRC:16,1021,FFFF,0000" ' CCITT
    crctypes(1) = "CRC:16,8005,0000,0000" ' CRC-16
    crctypes(2) = "CRC:16,8005,FFFF,0000" ' CRC-MODBUS
    
    ' lets try also some nonstandard variations with different init and final Xor, but stick
    ' to the known two polynoms.
    
    crctypes(3) = "CRC:16,1021,FFFF,FFFF"
    crctypes(4) = "CRC:16,1021,0000,FFFF"
    crctypes(5) = "CRC:16,1021,0000,0000"
    
    crctypes(6) = "CRC:16,8005,FFFF,FFFF"
    crctypes(7) = "CRC:16,8005,FFFF,0000"

    messageByteLen = (Len(crcTestMessage) + 1) / 3
    For reflectedInOrOut = 0 To 3
        For cType = 0 To 7
            crcSpec = crctypes(cType) & "," & IIf(reflectedInOrOut Mod 2 = 1, "Yes", "No") & "," & IIf(reflectedInOrOut > 1, "Yes", "No")
         DL.AddComment "Trying CRC spec : " & crcSpec
            For cStart = 1 To messageByteLen - 4
                For cEnd = cStart + 1 To messageByteLen - 2
                    subDataString = Mid(crcTestMessage, (cStart - 1) * 3 + 1, (cEnd - cStart + 1) * 3 - 1)
                    result = DL.CalcChecksum(crcSpec, subDataString, "H")
                    actualTelegramCrc = Mid(crcTestMessage, (messageByteLen - 2) * 3 + 1, Len(result))
                    resultInt = CLng("&h" + Left(result, 2)) * 256 + CLng("&h" + Right(result, 2))
                    found = (result = actualTelegramCrc)
                    If found Then
                        DL.AddComment "Found it!"
                        DL.AddComment "Relevant sequence for checksum from startpos=" & cStart & " to endpos=" & cEnd
                        DL.AddComment subDataString
                        DL.AddComment "CRC spec:   " & crcSpec
                        DL.AddComment "CRC result: " & result & " (Integer = " & resultInt & ")"
                        Exit Sub
                    End If
                Next
            Next
        Next
    Next

    DL.AddComment "Sorry, no matching CRC spec found"
    DL.AddComment "sequence:   " & subDataString
End Sub

Public Function IIf(blnExpression, vTrueResult, vFalseResult)
  If blnExpression Then
    IIf = vTrueResult
  Else
    IIf = vFalseResult
  End If
End Function



```

## DOCKLIGHT: Program Options

Colors.DispBack: #FFFFFF
Colors.CmtTextColor: #048106
Colors.Dir1TextColor: #2500A7
Colors.Dir2TextColor: #D00000

TextSetup.DispSequListRepresentation: 0
TextSetup.CommTextBold0: false
TextSetup.CommTextItalics0: false
TextSetup.CommTextUnderline0: false
TextSetup.CommTextBold1: false
TextSetup.CommTextItalics1: false
TextSetup.CommTextUnderline1: false
TextSetup.CommTextBold2: false
TextSetup.CommTextItalics2: false
TextSetup.CommTextUnderline2: false
TextSetup.DispFontSize: 10
TextSetup.DispCommWindowFormat: 0
TextSetup.ActualCommDisplayMode: 0
TextSetup.CommDisplayModeEnabled0: 1
TextSetup.CommDisplayModeEnabled1: 1
TextSetup.CommDisplayModeEnabled2: 1
TextSetup.CommDisplayModeEnabled3: 0
TextSetup.ControlCharNameInASCII: true
TextSetup.ControlCharSuppress: false

Stamp.Date: true
Stamp.Time: true
Stamp.NewLine: true
Stamp.MilliSeconds: true
Stamp.MilliSecondsV18Stamp: false
Stamp.AdditionalStampIntervals: false
Stamp.AdditionalStampIntervalsSeconds: 500
Stamp.AdditionalStampPause: false
Stamp.AdditionalStampPauseSeconds: 50

LogFile.ASCII: true
LogFile.Decimal: false
LogFile.HEX: false
LogFile.Binary: false
LogFile.Format: 0
LogFile.CommWindowDisabled: false
LogFile.NoHeaders: false
LogFile.AppendMode: true

Edit.Usershortcuts: 10,3,13,n,13,2,13,r,

Expert.ExpertNoDataForwarding: false
Expert.ExpertExternalProcessMode: false
Expert.ExpertDisableComHotplug: false
