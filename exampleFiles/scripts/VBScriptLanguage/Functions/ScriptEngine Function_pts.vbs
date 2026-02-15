' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: ScriptEngine Function.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 33082

'Example ScriptEngine

   Dim s
   s = ""   ' Build string with necessary info.
   s = ScriptEngine & " Version "
   s = s & ScriptEngineMajorVersion & "."
   s = s & ScriptEngineMinorVersion & "."
   s = s & ScriptEngineBuildVersion 

DL.AddComment s
