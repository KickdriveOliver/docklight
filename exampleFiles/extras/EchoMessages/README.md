# Echo Messages

This project echoes received messages back to the sender, acting as a software loopback endpoint. It is useful for validating framing, timing, and parser behavior without dedicated hardware.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required

## Files

| File | Description |
|------|-------------|
| EchoMessages.ptp | Docklight project file |
| EchoMessages.pts | Docklight Script |
| EchoMessages_ptp.txt | Text export of project file |
| EchoMessages_pts.vbs | VBScript export of script |

## Getting Started

1. Open `EchoMessages.pts` in Docklight Scripting.
2. Press `Shift+F5` to start the script. It loads the project via `DL.OpenProject` (target: `EchoMessages.ptp`).

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

