<p align="center">
	<a href="https://docklight.de">
		<img src="https://docklight.de/wp-content/uploads/2019/09/DL-LogoDocklight-half.png" alt="Docklight">
	</a>
</p>

# Docklight Examples

A collection of free examples, demos, projects, and Docklight Script code for serial communication testing and automation.

## About Docklight

### Docklight

Docklight is a testing, analysis and simulation tool for serial communication protocols (RS232, RS485/422 and others), running on Windows.

- Simulate serial protocol communication with configurable send/receive sequences
- Record and analyze RS232/RS485 data logging sessions
- Detect specific message sequences and trigger actions
- Build automated responses for communication partner emulation

Learn more at [docklight.de](https://docklight.de).

### Docklight Scripting

Docklight Scripting is an automated testing tool for serial communication protocols via COM (RS232, RS422/485), TCP (client and server), UDP peer, USB HID, Bluetooth HID and Named Pipes.

It includes an easy-to-use VBScript-based language for test automation.

Typical use cases:
- Endurance testing
- Time-controlled test jobs
- Device configuration
- Fault analysis
- CRC protocol testers
- Startup scripts

More details: [docklight.de](https://docklight.de).

## Examples Overview

This repository complements the online examples portal at [docklight.de/examples/](https://docklight.de/examples/), with source files and project assets ready for use.

### Device Examples ([exampleFiles/devices/](exampleFiles/devices/))

| Example | Description |
|---|---|
| [ArduinoExamples](exampleFiles/devices/ArduinoExamples/) | Arduino serial communication with LED control and Morse code |
| [ASTM_E1381_E1394_MedLab_Protocol_App](exampleFiles/devices/ASTM_E1381_E1394_MedLab_Protocol_App/) | ASTM E1381/E1394 file transfer for medical lab equipment |
| [BarionetExamples](exampleFiles/devices/BarionetExamples/) | Barix Barionet I/O controller (ASCII TCP, UDP, Modbus TCP, Serial) |
| [Datainterface_SCPI_Example](exampleFiles/devices/Datainterface_SCPI_Example/) | SCPI / Agilent HP34401 measurement instrument with simulator |
| [DocklightTapProductionTesting](exampleFiles/devices/DocklightTapProductionTesting/) | Docklight Tap / EZ Tap unit and production testing |
| [Faulhaber_RS232_Example](exampleFiles/devices/Faulhaber_RS232_Example/) | Faulhaber motion controllers via RS232 (MCBL, MCDC) |
| [Gardasoft_RT_Example](exampleFiles/devices/Gardasoft_RT_Example/) | Gardasoft Vision LED lighting controllers (RT series) |
| [HeliosPreisserDigitalIndicator_Example](exampleFiles/devices/HeliosPreisserDigitalIndicator_Example/) | Helios Preisser digital indicator distance reading via RS232 |
| [IMSTec-LEDcontroller](exampleFiles/devices/IMSTec-LEDcontroller/) | IMSTec Dual Intelligent Constant Current LED Controller ILC2008 |
| [JennyScienceXenaxDriveControlExample](exampleFiles/devices/JennyScienceXenaxDriveControlExample/) | JennyScience XENAX controller + LINAX/ELAX motor stage |
| [LogitechWirelessRumblepad2Example](exampleFiles/devices/LogitechWirelessRumblepad2Example/) | USB HID events from Logitech Wireless Rumblepad 2 |
| [RussoundControllersExample](exampleFiles/devices/RussoundControllersExample/) | Russound multi-zone audio controllers via RS-232 |
| [UT803_DigitalMultimeter_Example](exampleFiles/devices/UT803_DigitalMultimeter_Example/) | UNI-T UT803 digital multimeter with live display and CSV export |
| [ValhallaScientific_4300C_Example](exampleFiles/devices/ValhallaScientific_4300C_Example/) | Valhalla Scientific 4300C Digital Micro-Ohmmeter via RS232 |
| [VolpiIntraLED2020Example](exampleFiles/devices/VolpiIntraLED2020Example/) | Volpi IntraLED 2020 ASCII control protocol |
| [Voltcraft_PPS_PowerSupply_Example](exampleFiles/devices/Voltcraft_PPS_PowerSupply_Example/) | Voltcraft PPS power supplies via serial |

### Scripting & Automation ([exampleFiles/extras/](exampleFiles/extras/))

| Example | Description |
|---|---|
| [AcknowledgeTimeout](exampleFiles/extras/AcknowledgeTimeout/) | ACK/timeout handling for command-response protocols |
| [close_and_reopen_delay](exampleFiles/extras/close_and_reopen_delay/) | Close and re-open a serial port with configurable delay |
| [CobsEncoderDecoderExample](exampleFiles/extras/CobsEncoderDecoderExample/) | COBS encoder/decoder for Send and Receive Sequences |
| [CrcReverseEngineeringExample](exampleFiles/extras/CrcReverseEngineeringExample/) | Reverse-engineer CRC algorithms from example messages |
| [DatabaseOdbcConnectionExample](exampleFiles/extras/DatabaseOdbcConnectionExample/) | Connect Docklight to an ODBC database |
| [Docklight_Excel_Import_Export](exampleFiles/extras/Docklight_Excel_Import_Export/) | Excel VBA for importing/exporting Docklight project files |
| [DocklightProjectGen](exampleFiles/extras/DocklightProjectGen/) | Generate `.ptp` project files from HEX log files |
| [EchoMessages](exampleFiles/extras/EchoMessages/) | Echo received messages back (software loopback simulator) |
| [FlexibleAnswers](exampleFiles/extras/FlexibleAnswers/) | Variable responses using `DL_OnSend()` with rotating answers |
| [FloatConversionExample](exampleFiles/extras/FloatConversionExample/) | IEEE 754 float conversion (single/double precision) |
| [GenericReceiveSequences](exampleFiles/extras/GenericReceiveSequences/) | Recognize RX data and trigger responses |
| [LogFileNamesTimestamp](exampleFiles/extras/LogFileNamesTimestamp/) | Log file rotation with date/time-stamped filenames |
| [NamedPipe_Example](exampleFiles/extras/NamedPipe_Example/) | Windows Named Pipes communication (includes C++ server source) |
| [PacketLengthTest](exampleFiles/extras/PacketLengthTest/) | Detect extra bytes in received data packets |
| [ParitySwitch_9BitProtocols](exampleFiles/extras/ParitySwitch_9BitProtocols/) | Switch parity for 9-bit protocols |
| [Report_Splitter_Example](exampleFiles/extras/Report_Splitter_Example/) | Split long sequences into multiple transmission frames |
| [SendByteTiming](exampleFiles/extras/SendByteTiming/) | Configurable delay between individual characters |
| [SendSequenceLoop](exampleFiles/extras/SendSequenceLoop/) | Continuous loop of all Send Sequences with delay |
| [SideChannel_Example](exampleFiles/extras/SideChannel_Example/) | Additional communication channels for multi-channel monitoring |
| [TestRunnerExample](exampleFiles/extras/TestRunnerExample/) | CSV-based test runner with pass/fail reporting |

### USB HID ([exampleFiles/hid/](exampleFiles/hid/))

| Example | Description |
|---|---|
| [hid_demo_CO2_monitor](exampleFiles/hid/hid_demo_CO2_monitor/) | TFA-Dostmann CO2 monitor with live air quality display |
| [hid_demo_USB2Drive](exampleFiles/hid/hid_demo_USB2Drive/) | USB-to-CAN adapter in protocol and report-based modes |
| [hidapi_test](exampleFiles/hid/hidapi_test/) | HIDAPI test tools for enumerating USB HID devices |

### Network ([exampleFiles/network/](exampleFiles/network/))

| Example | Description |
|---|---|
| [PingPong_TCP](exampleFiles/network/PingPong_TCP/) | TCP client/server ping-pong demo |
| [PingPong_UDP_Loopback](exampleFiles/network/PingPong_UDP_Loopback/) | UDP loopback on localhost |
| [PingPong_UDP_Peer](exampleFiles/network/PingPong_UDP_Peer/) | UDP peer-to-peer with cross-connected ports |
| [TCP_Monitoring_HTTP](exampleFiles/network/TCP_Monitoring_HTTP/) | TCP/IP monitoring mode for HTTP traffic |

### Projects & Reference ([exampleFiles/projects/](exampleFiles/projects/) and [exampleFiles/scripts/](exampleFiles/scripts/))

| Example | Description |
|---|---|
| [ModemDiagnostics.ptp](exampleFiles/projects/ModemDiagnostics.ptp) | Modem AT command diagnostics |
| [PingPong.ptp](exampleFiles/projects/PingPong.ptp) | Basic serial port ping-pong tutorial |
| [ModbusRtuCrc](exampleFiles/projects/ModbusRtuCrc/) | Modbus RTU with CRC calculation and frame decoding |
| [VBScriptLanguage](exampleFiles/scripts/VBScriptLanguage/) | VBScript language reference (Functions, Methods, Objects, Properties, Statements) |

## File Format Guide

| Extension | Type | Description |
|---|---|---|
| `.ptp` | Project | Docklight project file with comm settings and send/receive sequences |
| `.pts` | Script | Docklight Script file (VBScript with Docklight header) |
| `.ptn` | Notepad | Project documentation in RTF format |
| `_ptp.txt` | Text export | Plain text export of `.ptp` project (human-readable in GitHub) |
| `_pts.vbs / _pts.txt` | Script export | Standard VBScript export of `.pts` (readable without Docklight) |
| `_ptn.txt` | Notepad export | Text export of `.ptn` documentation |

Native `.ptp`/`.pts`/`.ptn` files require Docklight to open. The text exports (`_ptp.txt`, `_pts.vbs`, `_ptn.txt`) are provided so you can browse example content directly on GitHub.

## Getting Started

1. Download and install [Docklight](https://docklight.de) (evaluation version available)
2. Clone or download this repository
3. Open any `.ptp` project file in Docklight
4. Review the project's Send/Receive Sequences and Notepad documentation
5. Press `F5` to start communication
6. For scripted examples, press `Shift+F5` to run the associated `.pts` script

Most device examples require the specific hardware connected via serial port. Network and loopback examples can run without additional hardware.

## Resources

- [Docklight Website](https://docklight.de) — Product information, downloads, and documentation
- [Docklight Examples Overview](https://docklight.de/examples/) — Additional example descriptions and downloads
- [Docklight Anchors Your AI](https://docklight.de/landing/Docklight-anchors-your-AI.html) — How deterministic testing complements AI-assisted development
- [Docklight Manual](https://docklight.de/manual/) — Full product documentation
- Support: support@docklight.de

## License

The example files in this repository are released under [CC0 1.0 Universal](LICENSE) (Public Domain). The Docklight application itself is commercial software by [Flachmann und Heggelbacher](http://fuh-edv.de).
