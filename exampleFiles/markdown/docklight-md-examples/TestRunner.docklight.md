# DOCKLIGHT:

format-version: 1


TestRunner_auto.pts
Date: 2019-07-11
Requires: Docklight Scripting V2.3.0 or higher
Author: Heggelbacher
 
A small test runner for a protocol with CR-terminated ASCIII commands. 

The runner reads a Commandlist.csv file in the following format

Test Case 1;cmd11;answer11
;cmd12;answer12
;cmd13;answer13
... more commands ...
Test Case 2;cmd21;answer21
;cmd22;answer22
;cmd23;answer23
.... and so on ...

How to use this example:
·	Start the script  using menu Scripting -> Run Script (Shift+F5) and follow the instructions
After a test run, the example should show 4 successful commands and 2 failures (wrong answer; timeout). The Communication window output in HEX could look like this: 

 Opening the Simulator.ptp test candidate in a second Docklight instance, using DL.ShellRun ...
 
 Please go to the second Docklight with the 'Simulator.ptp' project and
 * Start communication (press F5).
 Did you start it? Ready for the the test run? --> Press ENTER to continue

 
 Running the tests defined in 'CommandList.csv'...
 Next test: Test Case 1;cmd11;answer11

11.07.2019 12:55:17.351 [TX] - 63 6D 64 31 31 0D 
11.07.2019 12:55:17.372 [RX] - 61 6E 73 77 65 72 31 31 0D  Result: Test Case 1;cmd11;answer11 - passed
 
 Next test: Test Case 1;cmd12;answer12

11.07.2019 12:55:17.405 [TX] - 63 6D 64 31 32 0D 
11.07.2019 12:55:17.428 [RX] - 61 6E 73 77 65 72 31 32 0D  Result: Test Case 1;cmd12;answer12 - passed
 
 Next test: Test Case 1;cmd13;answer13

11.07.2019 12:55:17.455 [TX] - 63 6D 64 31 33 0D 
11.07.2019 12:55:17.465 [RX] - 61 6E 73 77 65 72 31 33 0D  Result: Test Case 1;cmd13;answer13 - passed
 
 Next test: A Second Test Case;cmd21;answer21

11.07.2019 12:55:17.494 [TX] - 63 6D 64 32 31 0D 
11.07.2019 12:55:17.502 [RX] - 61 6E 73 77 65 72 32 31 0D  Result: A Second Test Case;cmd21;answer21 - passed
 
 Next test: A Second Test Case;cmd22;answer22

11.07.2019 12:55:17.527 [TX] - 63 6D 64 32 32 0D 
11.07.2019 12:55:17.542 [RX] - 21 26 25 23 57 72 6F 6E 67 20 41 6E 73 77 65 72 21 0D  Result: A Second Test Case;cmd22;answer22 - failed, received wrong answer: >!&%#Wrong Answer!<
 
 Next test: A Second Test Case;NonExistingCommand;OfCourseNoAnswer

11.07.2019 12:55:17.577 [TX] - 4E 6F 6E 45 78 69 73 74 69 6E 67 43 6F 6D 6D 61 6E 64 0D  Result: A Second Test Case;NonExistingCommand;OfCourseNoAnswer - failed, timeout
 
 Test results
 =================================
 Passed = 4
 Failed = 2

## DOCKLIGHT: Communication Settings

communication-mode: 0  # Send/Receive
communication-filter: 0  # Show all
channel1-setting: LOCALHOST:10001
channel2-setting: COM2:9600,NONE,8,1,OFF,63,0
channel1-alias: 
channel2-alias: 

## DOCKLIGHT: Send Sequence List

### DOCKLIGHT: Send 0: Test

data: 54 65 73 74
repeat-active: false
repeat-interval: 5
checksum: 

## DOCKLIGHT: Receive Sequence List

### DOCKLIGHT: Receive 0: Telegram

data: ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 0D
reaction: -1  # (none)
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
Const VK_RETURN = &h0D
const CMD_TIMEOUT = 3000 ' 3 seconds default timeout

DL.ClearCommWindows

DL.AddComment "Opening the Simulator.ptp test candidate in a second Docklight instance, using DL.ShellRun ..."
DL.ShellRun "open", "TestRunner_SIMULATOR.ptp"

DL.AddComment
DL.AddComment "Please go to the second Docklight with the 'Simulator.ptp' project and"
DL.Addcomment "* Start communication (press F5)."
DL.Pause 2000
DL.AddComment "Did you start it? Ready for the the test run? --> Press ENTER to continue"
Do 
	DL.Pause 1
Loop Until (DL.GetKeyState(VK_RETURN) And 128)
DL.AddComment

FileInput.OpenFile "CommandList.csv"
DL.AddComment "Running the tests defined in 'CommandList.csv'..."

testCase = ""
cmd = ""
receivedAnswer = ""
failedTests = ""
failedCount = 0
passedTests = ""
passedCount = 0
Do Until FileInput.EndOfFile
	nextLine = Trim(FileInput.GetLine())
	If Instr(nextLine, ";") > 0 Then 
		splitLine = Split(nextLine, ";")
		If splitLine(0) <> "" Then testCase = splitLine(0)
		If UBound(splitLine) = 2 Then
			' contains three columns, must be a new telegram to test
			cmd = splitLine(1)
			expectedAnswer = splitLine(2)
			testSpec = testCase & ";" & cmd & ";" & expectedAnswer	
		 DL.AddComment "Next test: " & testSpec
		 thisResult = ""
			DL.ResetReceiveCounter
			receivedAnswer = ""
			DL.SendSequence "", cmd + Chr(13)
			Do 
				found = DL.WaitForSequence("Telegram", 1, CMD_TIMEOUT)
			Loop While (found And receivedAnswer = "") ' skip all empty answers
			If receivedAnswer = expectedAnswer Then
				passedCount = passedCount + 1
			 thisResult = " - passed"
				passedTests = passedTests & testSpec & thisResult & vbCrLf
			Else
				failedCount = failedCount + 1
				failedTests = failedTests & testSpec
				If found = 0 Then
			  thisResult = " - failed, timeout"
				Else
					thisResult = " - failed, received wrong answer: " & ">" & receivedAnswer & "<"
				End If
				failedTests = failedTests & thisResult & vbCrLf
			End If
		 DL.AddComment "Result: " & testSpec & thisResult 
		 DL.AddComment
		End If
	End If
Loop
FileInput.CloseFile

FileOutput.CreateFile "results.txt"
If failedCount > 0 Then 
	FileOutput.WriteLine "FAILED"
	FileOutput.WriteLine "FAILED TESTS:"
	FileOutput.WriteLine failedTests, False
Else
	FileOutput.WriteLine "PASSED"
End If
FileOutput.WriteLine "PASSED TESTS:"
FileOutput.WriteLine passedTests, False

DL.AddComment "Test results"
DL.AddComment "================================="
DL.AddComment "Passed = " & passedCount
DL.AddComment "Failed = " & failedCount

Sub DL_OnReceive()
    ' only the first non-empty answer counts
    If DL.OnReceive_GetName() = "Telegram" And receivedAnswer = "" Then
        ' store the received answer, but not the terminating <CR>
        receivedAnswer = DL.OnReceive_GetData("A", 1, -2)
	 ' ignore all extra LF
        receivedAnswer = Replace(receivedAnswer, "<LF>", "")
 	 ' ignore answers that are just repetitions of the question
        If receivedAnswer = cmd Then receivedAnswer = ""
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
