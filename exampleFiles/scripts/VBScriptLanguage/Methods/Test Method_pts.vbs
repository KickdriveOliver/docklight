' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Test Method.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 20951

' Example Test Method

Function RegExpTest(patrn, strng)
  Dim regEx, retVal            ' Create variable.
  Set regEx = New RegExp         ' Create regular expression.
  regEx.Pattern = patrn         ' Set pattern.
  regEx.IgnoreCase = False      ' Set case sensitivity.
  retVal = regEx.Test(strng)      ' Execute the search test.
  If retVal Then
    RegExpTest = "One or more matches were found."
  Else
    RegExpTest = "No match was found."
  End If
End Function
MsgBox(RegExpTest("is.", "IS1 is2 IS3 is4"))
