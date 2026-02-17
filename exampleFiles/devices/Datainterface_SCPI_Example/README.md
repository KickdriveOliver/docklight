# SCPI Data Interface Example

This SCPI example targets programmable instrument control with an Agilent/HP 34401 multimeter style command set. It ships with both an interface project and a simulator project, so it can be tested without physical hardware.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required
- Optional second Docklight instance when using the included simulator helper project

## Files

| File | Description |
|------|-------------|
| Agilent_HP34401_SIMULATOR.ptn | Project documentation (Notepad) |
| Agilent_HP34401_SIMULATOR.ptp | Docklight project file |
| Agilent_HP34401_SIMULATOR_auto.pts | Docklight Script |
| Agilent_HP34401_SIMULATOR_auto_pts.vbs | VBScript export of script |
| Agilent_HP34401_SIMULATOR_ptn.txt | Text export of documentation |
| Agilent_HP34401_SIMULATOR_ptp.txt | Text export of project file |
| datainterface_scpi.ptn | Project documentation (Notepad) |
| datainterface_scpi.ptp | Docklight project file |
| datainterface_SCPI_example_screenshot.png | Screenshot |
| datainterface_scpi_ptn.txt | Text export of documentation |
| datainterface_scpi_ptp.txt | Text export of project file |

## Getting Started

1. Open `datainterface_scpi.ptp` in Docklight Scripting.
2. Press `F5`. The matching `Agilent_HP34401_SIMULATOR_auto.pts` script is loaded automatically and started together with communication.
3. `Agilent_HP34401_SIMULATOR.ptp` is a helper simulator (not the main demo). The primary example is `datainterface_scpi.ptp`.
4. Use the simulator in a second Docklight instance only when you need to replace external hardware.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

