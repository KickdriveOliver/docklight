# CSV Test Runner Example

This test runner reads commands from CommandList.csv, executes them, and writes pass/fail outcomes to results.txt. A dedicated simulator project is included so tests can run with two Docklight instances and no external hardware.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required
- Optional second Docklight instance when using the included simulator helper project

## Files

| File | Description |
|------|-------------|
| CommandList.csv | Sample data file |
| results.txt | Text export or notes |
| TestRunner.ptn | Project documentation (Notepad) |
| TestRunner.ptp | Docklight project file |
| TestRunner_and_Simulator_Screenshot.png | Screenshot |
| TestRunner_auto.pts | Docklight Script |
| TestRunner_auto_pts.vbs | VBScript export of script |
| TestRunner_ptn.txt | Text export of documentation |
| TestRunner_ptp.txt | Text export of project file |
| TestRunner_SIMULATOR.ptn | Project documentation (Notepad) |
| TestRunner_SIMULATOR.ptp | Docklight project file |
| TestRunner_SIMULATOR_ptn.txt | Text export of documentation |
| TestRunner_SIMULATOR_ptp.txt | Text export of project file |

## Getting Started

1. Open `TestRunner.ptp` in Docklight Scripting.
2. Press `F5`. The matching `TestRunner_auto.pts` script is loaded automatically and started together with communication.
3. `TestRunner_SIMULATOR.ptp` is a helper simulator (not the main demo). The primary example is `TestRunner.ptp`.
4. Use the simulator in a second Docklight instance only when you need to replace external hardware.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

