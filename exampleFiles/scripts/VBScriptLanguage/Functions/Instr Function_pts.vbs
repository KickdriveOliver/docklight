' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Instr Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 29716

' Example Instr

Dim SearchString, SearchChar, MyPos

SearchString ="XXpXXpXXPXXP"   ' String to search in.
SearchChar = "P"   ' Search for "P".

MyPos = Instr(4, SearchString, SearchChar, 1)   
' A textual comparison starting at position 4. Returns 6.

MyPos = Instr(1, SearchString, SearchChar, 0)   
' A binary comparison starting at position 1. Returns 9.    

MyPos = Instr(SearchString, SearchChar)   
' Comparison is binary by default (last argument is omitted). Returns 9.

MyPos = Instr(1, SearchString, "W")   
' A binary comparison starting at position 1. Returns 0 ("W" is not found).entered: " & Input)
