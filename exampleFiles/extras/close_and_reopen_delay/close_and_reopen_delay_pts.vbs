' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: close_and_reopen_delay.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 56075

' close_and_reopen_delay.pts
' Close and immediately re-open a serial port with 
' user-defined additional delay time.
' Intended use: Debugging problems with bluetooth virtual ports 
' Applies to: Docklight Scripting V1.8
' Author: Heggelbacher
' Date: 2008-12-08
'
' Usage:
' 1. Choose the serial port in the Docklight projects settings 
'    (menu Tools-->Project Settings... or double-click on the serial settings 
'    box on the upper right)
' 2. Start the script using Shift + F5 (or menu Scripting-->Run Script)

myDelay = InputBox("Additional delay in milliseconds:","Close and re-open serial port","1")
DL.StartCommunication
DL.StopCommunication
DL.Pause myDelay 
DL.StartCommunication
DL.StopCommunication
