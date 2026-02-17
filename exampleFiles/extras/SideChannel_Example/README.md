# Side Channel Example

This example demonstrates additional communication channels operating alongside a primary channel for multi-stream monitoring. It combines project and script assets for side-channel orchestration.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required

## Files

| File | Description |
|------|-------------|
| SideChannel_Example.ptn | Project documentation (Notepad) |
| SideChannel_Example.ptp | Docklight project file |
| SideChannel_Example_auto.pts | Docklight Script |
| SideChannel_Example_auto_pts.vbs | VBScript export of script |
| SideChannel_Example_ptn.txt | Text export of documentation |
| SideChannel_Example_ptp.txt | Text export of project file |

## Getting Started

1. Open `SideChannel_Example_auto.pts` in Docklight Scripting.
2. Press `Shift+F5` to start the script. It loads the project via `DL.OpenProject` (target: `SideChannel_Example.ptp`).
3. Note: `SideChannel_Example_auto.pts` follows the _auto.pts convention and is auto-loaded with its matching project. Pressing `F5` starts communication and the auto script together.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

