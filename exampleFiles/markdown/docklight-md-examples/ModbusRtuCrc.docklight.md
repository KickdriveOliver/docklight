# DOCKLIGHT:

format-version: 1


This project demonstrates 
- basic Modbus RTU master functionality.
- basic Modbus frame seperation / decoding, e.g. when monitoring a RS485 bus. 

You can send different types of Modbus RTU commands with different Modbus Function Codes and uses Docklight's checksum functionality for on-the-fly CRC calculation. It also shows how to detect an incoming Modbus frame, and further process the data. 

You can also separate and parse incoming Modbus telegrams, even in 2-wire RS485 applications, as long as there is a significant communication pause between the telegrams. See the Receive Sequence  "Generic Frame Detector" for details. 

The project file uses the communication settings listed below, according to the Modbus implementation class "Basic":
Communication Mode = Send/Receive
Send/Receive on comm. Channel = COM1
COM Port Settings = 9600 Baud, Even parity, 8 Data Bits, 1 Stop Bit 

A Modbus Read Input command+answer could look like this: 

18.09.2019 20:28:01.867 [TX] - 01 04 00 01 00 01 60 0A 
18.09.2019 20:28:01.980 [RX] - 01 04 02 04 01 7A 30  
Detected Modbus Frame = 01 04 02 04 01 7A 30
SlaveID=01
FunctionCode=04
Addr/Data=02 04 01
CRC=7A 30
 
 Input Register Answer: Slave=001 ValueHex=0401


## DOCKLIGHT: Communication Settings

communication-mode: 0  # Send/Receive
communication-filter: 0  # Show all
channel1-setting: COM1:19200,EVEN,8,1,OFF,63,0
channel2-setting: COM2:19200,EVEN,8,1,OFF,63,0
channel1-alias: 
channel2-alias: 

## DOCKLIGHT: Send Sequence List

### DOCKLIGHT: Send 0: Write Single Register Adr=258, Value=7

data: 01 06 01 02 00 07 00 00
repeat-active: false
repeat-interval: 5
checksum: CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')


Example for Modbus Function Code 6 = Write Single Holding Register

Sequence Definition:
01 Address = 1
06 Function Code 6 = Write Single Holding Register
01 Address Hi Byte = 1
02 Address Lo Byte = 2 à Address = 1 * 256 + 2 = 258  
00 Data Hi = 0  
07 Data Lo = 7 à Integer Value = 7  
00 CRC Hi, dummy/placeholder
00 CRC Lo, dummy/placeholder
The applicable CRC is calculated according to the "checksum" setting on-the-fly

Example transmission:
16.09.2019 17:53:55.176 [TX] - 01 06 01 02 00 07 68 34  
Example Modbus slave answer:
16.09.2019 17:53:55.277 [RX] - 01 06 01 02 00 07 68 34 



### DOCKLIGHT: Send 1: Write Single Coil Adr=100,ON

data: 01 05 00 64 FF 00 00 00
repeat-active: false
repeat-interval: 5
checksum: CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')


Example for Modbus Function Code 5 = Write Single Coil (Write single digital output) 

Sequence Definition:
01 Address = 1
05 Function Code 5 = Write Single Coil
00 Address Hi Byte = 0
64 Address Lo Byte = 100 à Address = 0 * 256 + 100 = 100  
FF Data Hi = FF à Bit value 1 = ON
00 Data Lo (not used)
00 CRC Hi, dummy/placeholder
00 CRC Lo, dummy/placeholder
The applicable CRC is calculated according to the "checksum" setting on-the-fly

Example transmission:
16.09.2019 17:54:43.979 [TX] - 01 05 00 64 FF 00 CD E5 
Example Modbus slave answer:
16.09.2019 17:54:44.080 [RX] - 01 05 00 64 FF 00 CD E5 



### DOCKLIGHT: Send 2: Write Single Coil Adr=100,OFF

data: 01 05 00 64 00 00 00 00
repeat-active: false
repeat-interval: 5
checksum: CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')


Second example for Modbus Function Code 5 = Write Single Coil (Write single digital output) 

Like "Write Single Coil ON", but the output is now set to 0 = OFF

Sequence Definition:
01 Address = 1
05 Function Code 5 = Write Single Coil
00 Address Hi Byte = 0
64 Address Lo Byte = 100 à Address = 0 * 256 + 100 = 100  
00 Data Hi = 0 à Bit value 1 = OFF
00 Data Lo (not used)
00 CRC Hi, dummy/placeholder
00 CRC Lo, dummy/placeholder
The applicable CRC is calculated according to the "checksum" setting on-the-fly

Example transmission:
16.09.2019 17:19:56.204 [TX] - 01 05 00 64 00 00 8C 15 
Example Modbus slave answer:
16.09.2019 17:19:56.305 [RX] - 01 05 00 64 00 00 8C 15 



### DOCKLIGHT: Send 3: Read Input Register Slave=1

data: 01 04 00 01 00 01 00 00
repeat-active: false
repeat-interval: 5
checksum: CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')


Example for Modbus Function Code 4 = Read Input Register

Reads a single Register Value

Sequence Definition:
01 Address = 1
04 Function Code 4 = Read Input Register
00 Address Hi Byte = 0
01 Address Lo Byte = 1 
00 Number of Registers Hi = 0
01 Number of Registers Lo = 1 
00 CRC Hi, dummy/placeholder
00 CRC Lo, dummy/placeholder
The applicable CRC is calculated according to the "checksum" setting on-the-fly

Example transmission:
16.09.2019 17:43:28.277 [TX] - 01 04 00 01 00 01 60 0A 
Example Modbus slave answer:
16.09.2019 17:43:28.378 [RX] - 01 04 02 04 01 7A 30



### DOCKLIGHT: Send 4: Read Input Register Slave=2, Adr=1, Len=3

data: 02 04 00 01 00 03 00 00
repeat-active: false
repeat-interval: 5
checksum: CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')


Second example for Modbus Function Code 4 = Read Input Register
A request for three registers for Slave = 2

Sequence Definition:
02 Address = 2
04 Function Code 4 = Read Input Register
00 Address Hi Byte = 0
01 Address Lo Byte = 1 
00 Number of Registers Hi = 0
03 Number of Registers Lo = 3 
00 CRC Hi, dummy/placeholder
00 CRC Lo, dummy/placeholder
The applicable CRC is calculated according to the "checksum" setting on-the-fly

Example transmission:
16.09.2019 17:48:04.599 [TX] - 02 04 00 01 00 03 E1 F8
Example Modbus slave answer:
16.09.2019 17:48:04.700 [RX] - 02 04 06 04 01 00 00 FF FF 49 97



### DOCKLIGHT: Send 5: Read Input Register Slave=?,Adr=3,Len=1

data: ?? 04 00 03 00 01 00 00
repeat-active: false
repeat-interval: 5
checksum: CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')


Example for Modbus Function Code 4 = Read Input Register

Sequence Definition:
?? (Ask for Slave Address)
04 Function Code 4 = Read Input Register
00 Address Hi Byte = 0
03 Address Lo Byte = 3 
00 Number of Registers Hi = 0
01 Number of Registers Lo = 1 
00 CRC Hi, dummy/placeholder
00 CRC Lo, dummy/placeholder
The applicable CRC is calculated according to the "checksum" setting on-the-fly

Example transmission:
16.09.2019 17:43:28.277 [TX] - 01 04 00 03 00 01 C1 CA
Example Modbus slave answer:
16.09.2019 17:43:28.378 [RX] - 01 04 02 FF FF B8 80



## DOCKLIGHT: Receive Sequence List

### DOCKLIGHT: Receive 0: Generic Frame Detector

data: && 02 ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ?? ?? ?? ??
reaction: -1  # (none)
activated: true
comment: %_LDetected Modbus Frame = %_H(3,-1)%_LSlaveID=%_H(3,1)%_LFunctionCode=%_H(4,1)%_LAddr/Data=%_H(5,-3)%_LCRC=%_H(-2,-1)
linebreak: true
trigger: true
stop-comm: false
timestamp: true
checksum: (3, -3) CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')
checksum-validation: 0  # trigger when match


Example for detecting a valid Modbus frame in a continuous stream of data, e.g. when using Docklight Monitoring Mode and passively monitoring a RS485 bus. 

This sequence will detect any Modbus frame up to 32 bytes, if the following applies: 
- there is at least a 20 ms pause before telegram start
- the telegram has a correct CRC checksum at the end. 

By constantly looking out for a valid CRC checksum, Docklight is able to detect the actual end-of-telegram, even in a RX data stream of variable-length Modbus frames. 

See also the Checksum Setting   
(3, -3) CRC-MODBUS L
The first two characters are used for the 20ms delay specification, so the actual data begins at Receive Sequence Character no. 3

TIP: For a more elaborate frame detector you could use a small Docklight script and the Sub DL_OnReceive() event procedure.  

An example detection could look like this:
18.09.2019 20:23:29.197 [RX] - 01 06 01 02 00 07 68 34  
Detected Modbus Frame = 01 06 01 02 00 07 68 34
SlaveID=01
FunctionCode=06
Addr/Data=01 02 00 07
CRC=68 34



### DOCKLIGHT: Receive 1: Input Register Answer (2 byte)

data: ?? 04 02 ?? ?? 00 00
reaction: -1  # (none)
activated: true
comment: %_L Input Register Answer: Slave=%_D(1,1) ValueHex=%_H(4,1)%_H(5,1)
linebreak: true
trigger: true
stop-comm: false
timestamp: true
checksum: CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')
checksum-validation: 0  # trigger when match


Example for detecting & evaluating a Modbus slave answer to a "Function Code 4 = Read Input Register" request. This definition works for number registers = 1 / data size = 2 only. 

Sequence Definition:
?? Slave address, 0-255 accepted
04 Function Code 4 = Read Input Register
02 Number of Bytes = 2
?? Register Value Hi, 0-255 accepted 
?? Register Value Lo, 0-255 accepted 
00 CRC Hi, dummy/placeholder
00 CRC Lo, dummy/placeholder

Example processing: 

16.09.2019 17:30:52.006 [TX] - 01 04 00 01 00 01 60 0A 
16.09.2019 17:30:52.107 [RX] - 01 04 02 00 01 78 F0  Input Register Slave=001 ValueHex=0001

16.09.2019 17:30:59.668 [TX] - 01 04 00 01 00 01 60 0A 
16.09.2019 17:30:59.768 [RX] - 01 04 02 00 02 38 F1  Input Register Slave=001 ValueHex=0002

16.09.2019 17:31:07.268 [TX] - 01 04 00 01 00 01 60 0A 
16.09.2019 17:31:07.368 [RX] - 01 04 02 00 14 B9 3F  Input Register Slave=001 ValueHex=0014

16.09.2019 17:31:12.475 [TX] - 01 04 00 01 00 01 60 0A 
16.09.2019 17:31:12.580 [RX] - 01 04 02 04 01 7A 30  Input Register Slave=001 ValueHex=0401


## DOCKLIGHT: Script

script-version: 1
script-autostart: true

```vbscript
DL.LoadProgramOptions "ModbusRtuCrc_options.xml"
DL.StartCommunication

```

## DOCKLIGHT: Program Options

Colors.DispBack: #FFFFFF
Colors.CmtTextColor: #048106
Colors.Dir1TextColor: #2500A7
Colors.Dir2TextColor: #D00000

TextSetup.DispSequListRepresentation: 0
TextSetup.CommTextBold0: false
TextSetup.CommTextItalics0: false
TextSetup.CommTextUnderline0: false
TextSetup.CommTextBold1: false
TextSetup.CommTextItalics1: false
TextSetup.CommTextUnderline1: false
TextSetup.CommTextBold2: false
TextSetup.CommTextItalics2: false
TextSetup.CommTextUnderline2: false
TextSetup.DispFontSize: 10
TextSetup.DispCommWindowFormat: 0
TextSetup.ActualCommDisplayMode: 0
TextSetup.CommDisplayModeEnabled0: 1
TextSetup.CommDisplayModeEnabled1: 1
TextSetup.CommDisplayModeEnabled2: 1
TextSetup.CommDisplayModeEnabled3: 0
TextSetup.ControlCharNameInASCII: true
TextSetup.ControlCharSuppress: false

Stamp.Date: true
Stamp.Time: true
Stamp.NewLine: true
Stamp.MilliSeconds: true
Stamp.MilliSecondsV18Stamp: false
Stamp.AdditionalStampIntervals: false
Stamp.AdditionalStampIntervalsSeconds: 500
Stamp.AdditionalStampPause: false
Stamp.AdditionalStampPauseSeconds: 50

LogFile.ASCII: true
LogFile.Decimal: false
LogFile.HEX: false
LogFile.Binary: false
LogFile.Format: 0
LogFile.CommWindowDisabled: false
LogFile.NoHeaders: false
LogFile.AppendMode: true

Edit.Usershortcuts: 10,3,13,n,13,2,13,r,

Expert.ExpertNoDataForwarding: false
Expert.ExpertExternalProcessMode: false
Expert.ExpertDisableComHotplug: false
