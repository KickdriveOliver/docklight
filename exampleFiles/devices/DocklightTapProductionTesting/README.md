# Docklight Tap Production Testing

This directory contains production and QA communication tests for Docklight Tap / EZ Tap devices. Multiple project variants and an automation script are included for repetitive validation runs.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required
- Docklight Tap / EZ Tap test hardware

## Files

| File | Description |
|------|-------------|
| TapProductionTesting.ptn | Project documentation (Notepad) |
| TapProductionTesting.ptp | Docklight project file |
| TapProductionTesting_auto.pts | Docklight Script |
| TapProductionTesting_auto_pts.vbs | VBScript export of script |
| TapProductionTesting_ptn.txt | Text export of documentation |
| TapProductionTesting_ptp.txt | Text export of project file |
| TapProductionTesting_TAP.ptp | Docklight project file |
| TapProductionTesting_TAP_ptp.txt | Text export of project file |
| TapProductionTesting_VTP.ptp | Docklight project file |
| TapProductionTesting_VTP_ptp.txt | Text export of project file |

## Getting Started

1. Open `TapProductionTesting_auto.pts` in Docklight Scripting.
2. Press `Shift+F5` to start the script. It uses `DL.OpenProject` to select the matching production test project (`TapProductionTesting_VTP.ptp`, `TapProductionTesting_TAP.ptp`, or `TapProductionTesting.ptp`) based on the test path.
3. `TapProductionTesting_auto.pts` follows the `_auto.pts` convention. If you open one of the matching projects directly and press `F5`, the auto script is loaded and started together with communication.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

