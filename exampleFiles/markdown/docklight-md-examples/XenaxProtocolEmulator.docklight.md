# DOCKLIGHT:

format-version: 1

XenaxProtocolEmulator.ptp / XenaxProtocolEmulator_auto.pts
Date: 2019-03-13
Author: Heggelbacher 

- Provides a limited emulation of the JennyScience XENAX TCP Server on port 10001 and the ASCII protocol as documented in the XENAX Xvi75 User Manual. Only a subset of commands is supported. 

- The emulation supports all commands used in the XenaxDocklightDemo1_Polling.pts application example. To use this emulator as a target for the XenaxDocklightDemo1_Polling.pts application example, you need to change the Send/Receive channel in XenaxDocklighDemo.ptp from 192.168.2.100:10001 to LOCALHOST:10001 . 

- The answers may not accurately represent the state of a XENAX controller, but they are syntaxtically correct.

- REF and EVT1 support basic events (@S0, @H0, ...) as a syntax example, but not as an actual representation of a XENAX controller status. 

- The accompanying XenaxProtocolEmulator_auto.pts enables basic support for commands with arguments (e.g. "G10000") and ensures the answer contains the same parameter value. E.g. 

13.03.2019 13:49:52.108         [Client] - G28000<CR>

13.03.2019 13:49:52.117 [XENAX Emulator] - G28000<CR><LF>
>

13.03.2019 13:49:52.365         [Client] - G1000<CR>

13.03.2019 13:49:52.379 [XENAX Emulator] - G1000<CR><LF>
>


## DOCKLIGHT: Communication Settings

communication-mode: 0  # Send/Receive
communication-filter: 0  # Show all
channel1-setting: SERVER:10001
channel2-setting: COM2:9600,NONE,8,1,OFF,63,0
channel1-alias: XENAX Emulator
channel2-alias: Client

## DOCKLIGHT: Send Sequence List

### DOCKLIGHT: Send 0: EVT1<CR><LF>

data: 45 56 54 31 0D 0A 3E 40 53 30 0D 0A 3E 40 48 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 1: REF<CR><LF>

data: 52 45 46 0D 0A 3E && 0A 40 53 32 0D 0A 3E && 14 40 53 31 0D 0A 3E && 0A 40 53 32 0D 0A 3E && 32 40 53 31 0D 0A 3E 40 48 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 2: VER<CR><LF>

data: 56 45 52 0D 0A 76 34 2E 36 38 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum:  # (off, no checksum)

### DOCKLIGHT: Send 3: VERB<CR><LF>

data: 56 45 52 42 0D 0A 76 31 2E 30 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum:  # (off, no checksum)

### DOCKLIGHT: Send 4: TE<CR><LF>

data: 54 45 0D 0A 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum:  # (off, no checksum)

### DOCKLIGHT: Send 5: TES<CR><LF>

data: 54 45 53 0D 0A 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum:  # (off, no checksum)

### DOCKLIGHT: Send 6: TMT<CR><LF>

data: 54 4D 54 0D 0A 36 38 34 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum:  # (off, no checksum)

### DOCKLIGHT: Send 7: TT<CR><LF>

data: 54 54 0D 0A 32 39 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum:  # (off, no checksum)

### DOCKLIGHT: Send 8: TS<CR><LF>

data: 54 53 0D 0A 31 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 9: IFA<CR><LF>

data: 49 46 41 0D 0A 31 30 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 10: TEB<CR><LF>

data: 54 45 42 0D 0A 45 72 72 6F 72 20 42 75 66 65 72 20 31 0D 0A 45 72 72 6F 72 20 42 75 66 65 72 20 32 0D 0A 45 72 72 6F 72 20 42 75 66 65 72 20 33 0D 0A 45 72 72 6F 72 20 42 75 66 65 72 20 34 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum:  # (off, no checksum)

### DOCKLIGHT: Send 11: TPSR<CR><LF>

data: 54 50 53 52 0D 0A 30 32 30 30 30 31 31 61 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 12: TP<CR><LF>

data: 54 50 0D 0A 31 30 34 37 34 39 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 13: PQ<CR><LF>

data: 50 51 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 14: EVT0<CR><LF>

data: 45 56 54 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 15: SP200000<CR><LF>

data: 53 50 32 30 30 30 30 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 16: AC1000000<CR><LF>

data: 41 43 31 30 30 30 30 30 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 17: G80000<CR><LF>

data: 47 38 30 30 30 30 0D 0A 3E && 32 40 53 32 0D 0A 3E && 32 40 53 31 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 18: CCM0<CR><LF>

data: 43 43 4D 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 19: CCM1<CR><LF>

data: 43 43 4D 31 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 20: CRD44000<CR><LF>

data: 43 52 44 34 34 30 30 30 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 21: PWC<CR><LF>

data: 50 57 43 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 22: JN<CR><LF>

data: 4A 4E 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 23: SM<CR><LF>

data: 53 4D 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

### DOCKLIGHT: Send 24: JP<CR><LF>

data: 4A 50 0D 0A 3E
repeat-active: false
repeat-interval: 5
checksum: 

## DOCKLIGHT: Receive Sequence List

### DOCKLIGHT: Receive 0: EVT1 requested

data: 45 56 54 31 0D
reaction: 0  # EVT1<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 1: REF requested

data: 52 45 46 0D
reaction: 1  # REF<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 2: TS requested

data: 54 53 0D
reaction: 8  # TS<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 3: TP requested

data: 54 50 0D
reaction: 12  # TP<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 4: PWC requested

data: 50 57 43 0D
reaction: 21  # PWC<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 5: PQ requested

data: 50 51 0D
reaction: 13  # PQ<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 6: EVT0 requested

data: 45 56 54 30 0D
reaction: 14  # EVT0<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 7: SP requested

data: 53 50 ## ## ## ## ## ## ## ## ## ## ## ## 0D
reaction: 15  # SP200000<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 8: AC requested

data: 41 43 ## ## ## ## ## ## ## ## ## ## ## ## 0D
reaction: 16  # AC1000000<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 9: G requested

data: 47 ## ## ## ## ## ## ## ## ## ## ## ## 0D
reaction: 17  # G80000<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 10: JP requested

data: 4A 50 0D
reaction: 24  # JP<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 11: JN requested

data: 4A 4E 0D
reaction: 22  # JN<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 12: SM requested

data: 53 4D 0D
reaction: 23  # SM<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 13: CCM0 requested

data: 43 43 4D 30 0D
reaction: 18  # CCM0<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 14: CCM1 requested

data: 43 43 4D 31 0D
reaction: 19  # CCM1<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 15: CRD requested

data: 43 52 44 ## ## ## ## ## ## ## ## ## ## ## ## 0D
reaction: 20  # CRD44000<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 16: TE requested

data: 54 45 0D
reaction: 4  # TE<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum:  # (off, no checksum)
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 17: TES requested

data: 54 45 53 0D
reaction: 5  # TES<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum:  # (off, no checksum)
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 18: VER requested

data: 56 45 52 0D
reaction: 2  # VER<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum:  # (off, no checksum)
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 19: VERB requested

data: 56 45 52 42 0D
reaction: 3  # VERB<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum:  # (off, no checksum)
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 20: TPSR requested

data: 54 50 53 52 0D
reaction: 11  # TPSR<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum:  # (off, no checksum)
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 21: TT requested

data: 54 54 0D
reaction: 7  # TT<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum:  # (off, no checksum)
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 22: TMT requested

data: 54 4D 54 0D
reaction: 6  # TMT<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum:  # (off, no checksum)
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 23: TEB requested

data: 54 45 42 0D
reaction: 10  # TEB<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum:  # (off, no checksum)
checksum-validation: 0  # trigger when match

### DOCKLIGHT: Receive 24: IFA requested

data: 49 46 41 0D
reaction: 9  # IFA<CR><LF>
activated: true
comment: 
linebreak: false
trigger: true
stop-comm: false
timestamp: false
checksum: 
checksum-validation: 0  # trigger when match

## DOCKLIGHT: Script

script-version: 1
script-autostart: true

```vbscript
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
