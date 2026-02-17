# Arduino Serial LED Example

This example demonstrates serial communication between Docklight and an Arduino Uno Rev3, including basic LED control commands. It also includes a Docklight Script variant for generating Morse code patterns on the LED output.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required
- Arduino Uno Rev3 connected over serial (COM)

## Files

| File | Description |
|------|-------------|
| ArduinoSerialLED.ino | Arduino sketch |
| Docklight-Arduino-MorseCode.pts | Docklight Script |
| Docklight-Arduino-MorseCode_pts.vbs | VBScript export of script |
| Docklight-ArduinoSerial.ptn | Project documentation (Notepad) |
| Docklight-ArduinoSerial.ptp | Docklight project file |
| Docklight-ArduinoSerial_ptn.txt | Text export of documentation |
| Docklight-ArduinoSerial_ptp.txt | Text export of project file |

## Getting Started

1. Open `Docklight-ArduinoSerial.ptp` in Docklight Scripting.
2. Configure the interface parameters for your setup and press `F5` to start communication.
3. If you want the script-driven variant, open `Docklight-Arduino-MorseCode.pts` in Docklight Scripting and start it with `Shift+F5`.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*


