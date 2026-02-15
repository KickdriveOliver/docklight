' Docklight Scripting - Example Script
' Converted to standard .txt/.vbs format - Original file name: CobsEncoderDecoder_auto.pts
' The original .pts file start with 3 extra lines before the VBScript code: DL_SCRIPTVERSION token, version number (1), checksum):
' DL_SCRIPTVERSION
' 1
' 26457

DL.AddComment "COBS encoder / decoder active"

' keep this script running
Do
    DL.Pause 1 ' reduce CPU load
Loop

Sub DL_OnSend()
    ' COBS encoder, loosely based on the orignal Wikipedia C example at
    ' https://en.wikipedia.org/wiki/Consistent_Overhead_Byte_Stuffing
    ' How it works:
    ' Run through the original data and build an string with the encoded data,
    ' then set this as the new transmission data. (VBScript strings are unicode and can support
    ' Chr(0) zero characters, unlike C strings.)
    DL.AddComment
    DL.AddComment "=========================="
    DL.AddComment "Original data:"
    DL.AddComment DL.OnSend_GetData("H")
    
    encodeGroup = "" ' next group of max 254 bytes
    encode = "" ' final result
    code = 1
    For idx = 1 To DL.OnSend_GetSize()
        myByte = DL.OnSend_Peek(idx)
        If myByte > 0 Then
            encodeGroup = encodeGroup & Chr(myByte)
            ' (note the "&" here is VBScript for string concatenation)
            code = code + 1
        End If
        If myByte = 0 Or code = 255 Then
            encode = encode & Chr(code) ' overhead byte
            encode = encode & encodeGroup
            code = 1
            encodeGroup = ""
        End If
    Next
    ' final group, if there is
    If myByte = 0 Or Len(encodeGroup) > 0 Then
        encode = encode & Chr(code)
        encode = encode & encodeGroup
    End If
    ' add the trailing zero and set as new transmission data
    DL.OnSend_SetData encode & Chr(0), "A"
    
    DL.AddComment "COBS-encoded transmission data:"
End Sub


Sub DL_OnReceive()
    ' COBS decoder, see DL_OnSend() for the COBS workings above
    ' The receive sequence original data cannot be manipulated, so what we do is
    ' create a new hex string "decode" with the original data
    nextBlockIdx = 1
    blockSize = 0
    decode = ""
    idx = 1
    code = 255
    While idx < DL.OnReceive_GetSize() ' process everything except trailing zero
        If code < 255 Then
            decode = decode & "00 " ' restore the original zero
        End If
        code = DL.OnReceive_Peek(idx)
        If code > 1 Then
            ' append this group's non-zero data (plus another separator space)
            decode = decode & DL.OnReceive_GetData("H", idx + 1, code - 1) & " "
        End If
        If code > 0 Then
            idx = idx + code
        Else
            ' Illegal COBS sequence, there should be no zero here. Abort with error.
            decode = "ERROR"
            idx = DL.OnReceive_GetSize()
        End If
    Wend
    DL.AddComment
    DL.AddComment "COBS decoded data: "
    DL.AddComment decode
    ' TODO: Add your own processing of decoded data here
End Sub

