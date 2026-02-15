' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: FloatConversionExample.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 54030

' FloatConversionExample.pts
' Author: Heggelbacher
' Date: 2010-07-05
' Applies To: Docklight Scripting V1.9.106 Customer Support Version

' Note: Float representations are locale-aware! Some countries use 
' the dot '.', other use a comma ',' as the decimal point.

' convert from IEEE single precision (32 bit) representation
' using parameter "stof" ('sequence to float')
DL.AddComment DL.ConvertSequenceData("4B 06 9E 3F", "stof", "H")

' convert from IEEE double precision (64 bit) representation
' using parameter "stod" ('sequence to double')
DL.AddComment DL.ConvertSequenceData("67 9A 95 A0 51 A1 24 4B", "stod", "H")

' convert a float number to a HEX sequence string which represents 
' a IEEE single precision float (32 bit), lower bytes first
' using parameter "ftos" -> ('float to sequence')
DL.AddComment DL.ConvertSequenceData("1,234567", "ftos", "H") 

' convert a float number to a HEX sequence string which represents
' a IEEE double precision float (64 bit), lower bytes first
' using parameter "dtos" -> ('double to sequence')
DL.AddComment DL.ConvertSequenceData("0,987987987987E54", "dtos", "H")
