# Acknowledge Timeout Handling

This scripting example demonstrates ACK/timeout handling in command-response protocols by waiting for an expected ACK sequence within a fixed time budget. A companion simulator project allows complete testing with two Docklight instances and no external hardware.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required
- Optional second Docklight instance when using the included simulator helper project

## Files

| File | Description |
|------|-------------|
| AcknowledgeDeviceSimulator.ptn | Project documentation (Notepad) |
| AcknowledgeDeviceSimulator.ptp | Docklight project file |
| AcknowledgeDeviceSimulator_ptn.txt | Text export of documentation |
| AcknowledgeDeviceSimulator_ptp.txt | Text export of project file |
| AcknowledgeTest.pts | Docklight Script |
| AcknowledgeTest_pts.vbs | VBScript export of script |
| AcknowledgeTestPrj.ptn | Project documentation (Notepad) |
| AcknowledgeTestPrj.ptp | Docklight project file |
| AcknowledgeTestPrj_ptn.txt | Text export of documentation |
| AcknowledgeTestPrj_ptp.txt | Text export of project file |

## Getting Started

1. Open `AcknowledgeTest.pts` in Docklight Scripting.
2. Press `Shift+F5` to start the script. It loads the project via `DL.OpenProject` (target: `AcknowledgeTestPrj.ptp`).
3. `AcknowledgeDeviceSimulator.ptp` is a helper simulator (not the main demo). The primary example is `AcknowledgeTestPrj.ptp`.
4. Use the simulator in a second Docklight instance only when you need to replace external hardware.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

