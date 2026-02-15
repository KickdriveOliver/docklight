' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: Replace Method.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 30314

' Example Replace Method

Function ReplaceTest(patrn, replStr)
  Dim regEx, str1               ' Create variables.
  str1 = "The quick brown fox jumped over the lazy dog."
  Set regEx = New RegExp            ' Create regular expression.
  regEx.Pattern = patrn            ' Set pattern.
  regEx.IgnoreCase = True            ' Make case insensitive.
  ReplaceTest = regEx.Replace(str1, replStr)   ' Make replacement.
End Function

DL.AddComment (ReplaceTest("fox", "cat"))      ' Replace 'fox' with 'cat'.
