' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: PacketLengthTest.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 20427

' PacketLengthTest.pts
' Detecting "extra" bytes (e.g. 5 bytes in a data packet received instead of 4)
' This sample script can be used when there is a significant pause between two data 
' packets and you need to check for a maximum packet length which may not be exceeded.
' The script uses the pause to detect the begin of a new data packet. It then counts 
' the incoming bytes and checks if the data exceeds the maximum permitted length.
' 
' The script works with the evaluation version of Docklight Scripting. 
' Maybe you need to modify some of the project settings in the accompanying 
' "ByteCounter.ptp" project file and save the changes before using the sample.

DL.OpenProject "ByteCounter"

DL.ClearCommWindows
DL.AddComment "Testing packet length:"
DL.AddComment "Checking the received data packet length and detecting 'extra' bytes"
DL.AddComment

' Get parameters
pauseBetweenPackets = CSng(InputBox("Enter the minimum pause between two data packets in seconds", "Testing packet length", 0.2))
maxPacketLength = CInt(InputBox("Enter the maximum data packet length in bytes", "Testing packet length", 4))

DL.AddComment "Minimum pause = " & pauseBetweenPackets & " seconds"
DL.AddComment "Maximum packet length = " & maxPacketLength & " bytes"


' Initialize
lastByteReceived = Timer
byteCount = 0
oldByteCount = 0
extraByteFound = False
DL.AddComment "Starting Communication..."
DL.StartCommunication

While Not extraByteFound
    ' Beginning of new sequence?
    If (byteCount > 0) And (Timer - lastByteReceived) >= pauseBetweenPackets Then
        DL.ResetReceiveCounter ("ByteCounter")
        byteCount = 0
    End If
    ' New bytes received?
    oldByteCount = byteCount
    byteCount = DL.GetReceiveCounter("ByteCounter")
    If oldByteCount <> byteCount Then
	lastByteReceived = Timer
    	' Maximum sequence length exceeded?
    	If byteCount > maxPacketLength Then
		DL.AddComment
       	DL.AddComment "Detected extra byte(s). Stopping."
        	extraByteFound = True
       End If
    End If
Wend
