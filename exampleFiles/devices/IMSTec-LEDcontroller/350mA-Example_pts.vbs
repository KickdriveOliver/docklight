' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: 350mA-Example.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 39175

' Docklight Example for controlling two 350mA LEDs in continous mode 
' 350mA-Example.pts
' Marco Flachmann
' 2009-07-02

' Precondition for the script is project "IMSTec-LEDcontroller"
' you can delete the inverted comma (') if you want to open
' the project inside this script:

' DL.OpenProject "IMSTec-LEDcontroller"

' --------------------- max valid current values ---------------------
dim maxCurrent(2)
maxCurrent(0) = 0   '0 mA - is taken as minimum for both channels
maxCurrent(1) = 350 'mA
maxCurrent(2) = 350 'mA

' Endless loop which raises input boxes for channel and current
Do
  channel = InputBox("Light Source '1' or '2'"+vbCr+"1 = Channel 1"+vbCr+"2 = Channel 2", "Choose Channel", "1")
  If Not((channel = "1") Or (channel = "2")) Then DL.Quit
  inChannel = Cint(channel)

  tempprompt = "Choose current [mA] for channel "+channel+vbCr+"min = "+CStr(maxCurrent(0))+vbCr+"max = "+CStr(maxCurrent(CInt(channel)))
  intensity = InputBox(tempprompt, "Choose current in mA", Cstr(maxCurrent(CInt(channel))))

  intensity = Validate(intensity)

  'now send this settings to the light source:
  parameters = channel + " C 1" ' continuos mode for this channel
  SendAndWait "set <channel>,<parameter>,<value>", parameters 

  parameters = channel + " I " + intensity  'intensity for this channel
  SendAndWait "set <channel>,<parameter>,<value>", parameters 

  SendAndWait "SAVE", ""	'store permanent
Loop

Sub SendAndWait (command, parameters)
	DL.ResetReceiveCounter
	DL.SendSequence command, parameters
	DL.WaitForSequence "ready"
End Sub

Function Validate(current)
  If IsNumeric(current) Then
      current = replace (current, ".", ",")	' Replace dot with comma
	'inCurrent = CInt(current) 
	inCurrent = CDbl(current) 
	current = replace (current, ",", ".")	' Replace comma with dot again
	If inCurrent*2 = CInt(inCurrent*2) Then
		' We've got an multiple of 0.5 
		If  inCurrent <= maxCurrent(inChannel) And inCurrent >= maxCurrent(0) Then
			' value is in the valid range
		Else
			MessageAndQuit(current)
		End If
	Else
		MessageAndQuit(current)
	End If		
  Else 
	MessageAndQuit(current)
  End If
  Validate = current
End Function

Sub MessageAndQuit(intensity)
	MsgBox "Invalid value: " + intensity
	DL.Quit
End Sub
