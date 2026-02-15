' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Do_Loop Statement.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 2782

'Example Do..Loop Statement

Do Until DefResp = vbNo
   MyNum = Int (6 * Rnd + 1)   ' Generate a random integer between 1 and 6.
   DefResp = MsgBox (MyNum & " Do you want another number?", vbYesNo)
Loop
