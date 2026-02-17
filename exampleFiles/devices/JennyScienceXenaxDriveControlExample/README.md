# JennyScience XENAX Drive Control

This is a multi-script control example for JennyScience XENAX controllers and LINAX/ELAX stages, including Demo, Polling, and Events modes. A protocol emulator project is included for hardware-free experimentation, and the MultiAxisTestingExample subfolder provides extended multi-axis scenarios.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required
- JennyScience XENAX servo drive controller

## Files

| File | Description |
|------|-------------|
| MultiAxisTestingExample/ | Subdirectory with additional examples |
| XenaxDocklightDemo-info-DE.docx | Documentation |
| XenaxDocklightDemo-info-DE.pdf | Documentation |
| XenaxDocklightDemo-info.pdf | Documentation |
| XenaxDocklightDemo.ptn | Project documentation (Notepad) |
| XenaxDocklightDemo.ptp | Docklight project file |
| XenaxDocklightDemo.pts | Docklight Script |
| XenaxDocklightDemo1_Polling.pts | Docklight Script |
| XenaxDocklightDemo1_Polling_ExampleLog_asc.txt | Text export or notes |
| XenaxDocklightDemo1_Polling_ExampleLog_hex.txt | Text export or notes |
| XenaxDocklightDemo1_Polling_pts.vbs | VBScript export of script |
| XenaxDocklightDemo2_Events.pts | Docklight Script |
| XenaxDocklightDemo2_Events_ExampleLog_asc.txt | Text export or notes |
| XenaxDocklightDemo2_Events_ExampleLog_hex.txt | Text export or notes |
| XenaxDocklightDemo2_Events_pts.vbs | VBScript export of script |
| XenaxDocklightDemo_log_asc.txt | Text export or notes |
| XenaxDocklightDemo_log_hex.txt | Text export or notes |
| XenaxDocklightDemo_ptn.txt | Text export of documentation |
| XenaxDocklightDemo_ptp.txt | Text export of project file |
| XenaxDocklightDemo_pts.vbs | VBScript export of script |
| XenaxDocklightDemo_Screenshot.png | Screenshot |
| XenaxProtocolEmulator.ptn | Project documentation (Notepad) |
| XenaxProtocolEmulator.ptp | Docklight project file |
| XenaxProtocolEmulator_auto.pts | Docklight Script |
| XenaxProtocolEmulator_auto_pts.vbs | VBScript export of script |
| XenaxProtocolEmulator_ptn.txt | Text export of documentation |
| XenaxProtocolEmulator_ptp.txt | Text export of project file |

## Getting Started

1. Read `XenaxDocklightDemo-info.pdf` (or `XenaxDocklightDemo-info-DE.pdf` / `.docx`) first for setup, controller mapping, and workflow details.
2. Open `XenaxDocklightDemo.ptp` in Docklight Scripting.
3. Start communication with `F5` for manual operation, or run `XenaxDocklightDemo.pts` with `Shift+F5` for the scripted demo flow.
4. Use `XenaxProtocolEmulator.ptp` + `XenaxProtocolEmulator_auto.pts` as the helper simulator when no hardware is connected.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

