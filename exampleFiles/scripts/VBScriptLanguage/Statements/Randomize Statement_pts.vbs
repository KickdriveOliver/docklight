' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Randomize Statement.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 32551

'Example Randomize Statement

Dim MyValue, Response
Randomize   ' Initialize random-number generator.
Do Until Response = vbNo
   MyValue = Int((6 * Rnd) + 1)   ' Generate random value between 1 and 6.
   MsgBox MyValue
   Response = MsgBox ("Roll again? ", vbYesNo)
Loop
