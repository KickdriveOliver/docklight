# DOCKLIGHT:

format-version: 1

Automated Loopback Test — Command-Line Driven CI/CD Example

This project demonstrates automated protocol verification using a UDP loopback channel that requires no external hardware. It is designed to be run from the command line:

    Docklight_Scripting.exe -r automated_loopback_test.docklight.md

The script will:
1. Start logging to a text file (created as `automated_loopback_test_log_asc.txt`
   in Docklight's `ScriptSamples` directory)
2. Open UDP loopback communication on `UDP:LOCALHOST:10001`
3. Send a series of test commands and wait for each loopback echo
4. Use a Receive Sequence with a COMMENT string to write "PASS - device 
   command reaction OK" into the log for each successful response
5. Stop logging & communication, then quit

After the Docklight process exits, the log file can be evaluated by an external 
script (e.g. PowerShell) to determine overall test success.

Note: Docklight resolves script-relative log paths from its `ScriptSamples`
directory and appends a `_asc.txt` suffix for ASCII-format log files.

Expected Communication output:

 === Automated Loopback Test ===
 Sending test command 1 of 3: PING

24.02.2026 10:00:01.100 [TX] - 50 49 4E 47 0D 0A 
24.02.2026 10:00:01.105 [RX] - 50 49 4E 47 0D 0A  PASS - device command reaction OK

 Test 1 result: PASS

 Sending test command 2 of 3: STATUS

24.02.2026 10:00:01.210 [TX] - 53 54 41 54 55 53 0D 0A 
24.02.2026 10:00:01.215 [RX] - 53 54 41 54 55 53 0D 0A  PASS - device command reaction OK

 Test 2 result: PASS

 Sending test command 3 of 3: VERSION

24.02.2026 10:00:01.320 [TX] - 56 45 52 53 49 4F 4E 0D 0A 
24.02.2026 10:00:01.325 [RX] - 56 45 52 53 49 4F 4E 0D 0A  PASS - device command reaction OK

 Test 3 result: PASS

 === Test Summary ===
 Total:  3
 Passed: 3
 Failed: 0
 Result: ALL TESTS PASSED

## DOCKLIGHT: Communication Settings

communication-mode: 0  # Send/Receive
communication-filter: 0  # Show all
channel1-setting: UDP:LOCALHOST:10001
channel2-setting: COM2:9600,NONE,8,1,OFF,63,0
channel1-alias: 
channel2-alias: 

## DOCKLIGHT: Send Sequence List

### DOCKLIGHT: Send 0: PING

data: 50 49 4E 47 0D 0A
repeat-active: false
repeat-interval: 5
checksum: 

A simple PING command terminated by CR+LF. In a real-world scenario this could be any device command.

### DOCKLIGHT: Send 1: STATUS

data: 53 54 41 54 55 53 0D 0A
repeat-active: false
repeat-interval: 5
checksum: 

A STATUS request command terminated by CR+LF.

### DOCKLIGHT: Send 2: VERSION

data: 56 45 52 53 49 4F 4E 0D 0A
repeat-active: false
repeat-interval: 5
checksum: 

A VERSION query command terminated by CR+LF.

## DOCKLIGHT: Receive Sequence List

### DOCKLIGHT: Receive 0: Loopback Echo

data: ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 0D 0A
reaction: -1  # (none)
activated: true
comment: PASS - device command reaction OK
linebreak: true
trigger: true
stop-comm: false
timestamp: true
checksum: 
checksum-validation: 0  # trigger when match

Detects any loopback echo up to 20 characters, terminated by CR+LF. When triggered, the COMMENT string "PASS - device command reaction OK" is appended to the Communication window (and log file), confirming the command was echoed back successfully.

In a real-world scenario, you would define more specific receive patterns to verify the actual device response content.

## DOCKLIGHT: Script

script-version: 1
script-autostart: true

```vbscript
' automated_loopback_test — CI/CD command-line example
' Run with: Docklight_Scripting.exe -r automated_loopback_test.docklight.md
'
' Uses UDP loopback (UDP:LOCALHOST:10001) — no external hardware required.
' Writes results to automated_loopback_test_log.txt for external evaluation.

Const CMD_TIMEOUT = 5000  ' 5 seconds timeout per command
Const LOG_FILE = "automated_loopback_test_log"

' Build the list of test commands (Send Sequence names)
Dim testCommands(2)
testCommands(0) = "PING"
testCommands(1) = "STATUS"
testCommands(2) = "VERSION"

totalTests = UBound(testCommands) + 1
passedCount = 0
failedCount = 0

DL.ClearCommWindows

' Start logging to a text file (overwrite mode, ASCII representation)
DL.StartLogging LOG_FILE, False, "A", False, False

DL.AddComment "=== Automated Loopback Test ==="

DL.AddComment
DL.AddComment "Log file output path: " & DL.GetEnvironment("DOCKLIGHT_SCRIPTDIR") & LOG_FILE & "_asc.txt"
DL.AddComment

' Start communication on the UDP loopback channel
DL.StartCommunication

For i = 0 To UBound(testCommands)
    cmdName = testCommands(i)
    testNum = i + 1

    DL.AddComment "Sending test command " & testNum & " of " & totalTests & ": " & cmdName

    ' Reset receive counter so WaitForSequence detects new data only
    DL.ResetReceiveCounter

    ' Send the predefined sequence by name
    DL.SendSequence cmdName

    ' Wait for the loopback echo (Receive Sequence "Loopback Echo")
    found = DL.WaitForSequence("Loopback Echo", 1, CMD_TIMEOUT)

    If found Then
        passedCount = passedCount + 1
        DL.AddComment "Test " & testNum & " result: PASS"
    Else
        failedCount = failedCount + 1
        DL.AddComment "Test " & testNum & " result: FAIL - timeout waiting for echo"
    End If

    DL.AddComment ""
Next

' Summary
DL.AddComment "=== Test Summary ==="
DL.AddComment "Total:  " & totalTests
DL.AddComment "Passed: " & passedCount
DL.AddComment "Failed: " & failedCount

If failedCount = 0 Then
    DL.AddComment "Result: ALL TESTS PASSED"
Else
    DL.AddComment "Result: " & failedCount & " TEST(S) FAILED"
End If

' Clean shutdown
DL.StopCommunication
DL.StopLogging

' Quit Docklight so the command-line call returns
DL.Quit
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
LogFile.AppendMode: false

Edit.Usershortcuts: 10,3,13,n,13,2,13,r,

Expert.ExpertNoDataForwarding: false
Expert.ExpertExternalProcessMode: false
Expert.ExpertDisableComHotplug: false
