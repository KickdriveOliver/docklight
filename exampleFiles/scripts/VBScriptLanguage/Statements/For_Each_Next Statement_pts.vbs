' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: For_Each_Next Statement.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 58849

'Example For..Each..Next Statement


Function ShowFolderList(folderspec)
   Dim fso, f, f1, fc, s
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f = fso.GetFolder(folderspec)
   Set fc = f.Files
   For Each f1 in fc
      s = s & f1.name 
      s = s & "<BR>"
   Next
   ShowFolderList = s
End Function
