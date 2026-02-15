' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: InstrRev Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 47768

' Example InstrRev


Dim SearchString, SearchChar, MyPos
SearchString ="XXpXXpXXPXXP"   ' String to search in.
SearchChar = "P"   ' Search for "P".

MyPos = InstrRev(SearchString, SearchChar, 10, 0)   
' A binary comparison starting at position 10. Returns 9.

MyPos = InstrRev(SearchString, SearchChar, -1, 1)   
' A textual comparison starting at the last position. Returns 12.

MyPos = InstrRev(SearchString, SearchChar, 8)   
' Comparison is binary by default (last argument is omitted). Returns 0.
