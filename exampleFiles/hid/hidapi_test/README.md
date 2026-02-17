# HIDAPI Test Tools (Docklight Context)

This folder packages HIDAPI utilities used with Docklight USB HID workflows, especially for device enumeration and quick communication checks. It complements Docklight HID examples and should be read together with the upstream `README.md` already in this directory.

For more information on HIDAPI see [libusb/hidapi](https://github.com/libusb/hidapi). 

## Requirements

- Windows environment for the provided executables
- USB HID device connected for enumeration/testing
- Docklight with USB HID support

## Files

| File | Description |
|------|-------------|
| AUTHORS.txt | Text export or notes |
| create_device_list.bat | Batch script to enumerate HID devices |
| HACKING.txt | Text export or notes |
| hidapi.dll | HIDAPI runtime library, built+codesigned by Kickdrive Software |
| hidtest.exe | Console HID test tool, built+codesigned by Kickdrive Software |
| LICENSE-bsd.txt | HIDAPI license file |
| LICENSE-gpl3.txt | HIDAPI license file |
| LICENSE-orig.txt | HIDAPI license file |
| LICENSE.txt | HIDAPI license file |
| output.txt | Sample HID enumeration output |
| readme_from_docklight.txt | Information on Docklight's own build, codesigning and how to use this |
| testgui.exe | GUI HID test tool, built+codesigned by Kickdrive Software |

## Getting Started

1. Read the existing `README.md` for upstream HIDAPI project details
2. Run `create_device_list.bat` to capture connected HID devices
3. Use `hidtest.exe` or `testgui.exe` to validate HID communication
4. Use the identified VID/PID values in Docklight HID example projects

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*
