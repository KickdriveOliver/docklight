# ASTM E1381 / E1394 Medical Lab Protocol

This package shows ASTM E1381/E1394 communication workflows for medical laboratory interfaces, including automated transfer sequences. It includes a dedicated device simulator project so the protocol flow can be exercised with two Docklight instances.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required
- Optional second Docklight instance when using the included simulator helper project

## Files

| File | Description |
|------|-------------|
| ASTM_E1381_E1394-DEVICE-SIMULATOR-TestExport.pts | Docklight Script |
| ASTM_E1381_E1394-DEVICE-SIMULATOR-TestExport_pts.vbs | VBScript export of script |
| ASTM_E1381_E1394-DEVICE-SIMULATOR.ptn | Project documentation (Notepad) |
| ASTM_E1381_E1394-DEVICE-SIMULATOR.ptp | Docklight project file |
| ASTM_E1381_E1394-DEVICE-SIMULATOR_ptn.txt | Text export of documentation |
| ASTM_E1381_E1394-DEVICE-SIMULATOR_ptp.txt | Text export of project file |
| ASTM_E1381_E1394.ptn | Project documentation (Notepad) |
| ASTM_E1381_E1394.ptp | Docklight project file |
| ASTM_E1381_E1394_auto.pts | Docklight Script |
| ASTM_E1381_E1394_auto_pts.vbs | VBScript export of script |
| ASTM_E1381_E1394_ptn.txt | Text export of documentation |
| ASTM_E1381_E1394_ptp.txt | Text export of project file |
| docklight_scripting_E1381_E1394_example_screenshot.png | Screenshot |
| EXPORT.DAT | Sample data file |
| IMPORT.DAT | Sample data file |
| IMPORT_2020-4-14_11-47.DAT | Sample data file |

## Getting Started

1. Open `ASTM_E1381_E1394.ptp` in Docklight Scripting for the main host-side protocol flow.
2. Press `F5`. The matching `ASTM_E1381_E1394_auto.pts` script is loaded automatically and started together with communication.
3. For hardware-free testing, open `ASTM_E1381_E1394-DEVICE-SIMULATOR.ptp` in a second Docklight instance.
4. If you need scripted simulator-side export behavior, open `ASTM_E1381_E1394-DEVICE-SIMULATOR-TestExport.pts` and start it with `Shift+F5`.
5. `ASTM_E1381_E1394-DEVICE-SIMULATOR.ptp` is a helper simulator (not the main demo). The primary example is `ASTM_E1381_E1394.ptp`.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

