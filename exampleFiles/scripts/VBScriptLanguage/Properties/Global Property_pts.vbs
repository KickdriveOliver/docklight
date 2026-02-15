' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Global Property.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 45990

'Example Global Property

Function RegExpTest(patrn, strng)
   Dim regEx, Match, Matches   ' Create variable.
   Set regEx = New RegExp   ' Create a regular expression.
   regEx.Pattern = patrn   ' Set pattern.
   regEx.IgnoreCase = True   ' Set case insensitivity.
   regEx.Global = True   ' Set global applicability.
   Set Matches = regEx.Execute(strng)   ' Execute search.
   For Each Match in Matches   ' Iterate Matches collection.
      RetStr = RetStr & "Match found at position "
      RetStr = RetStr & Match.FirstIndex & ". Match Value is '"
      RetStr = RetStr & Match.Value & "'." & vbCRLF
   Next
   RegExpTest = RetStr
End Function
MsgBox(RegExpTest("is.", "IS1 is2 IS3 is4"))
