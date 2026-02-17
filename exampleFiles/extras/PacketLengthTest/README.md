# Packet Length Test

This script validates packet lengths and detects trailing or extra bytes in receive data streams. It is useful for strict protocol conformance testing.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required

## Files

| File | Description |
|------|-------------|
| ByteCounter.ptp | Docklight project file |
| ByteCounter_ptp.txt | Text export of project file |
| PacketLengthTest.pts | Docklight Script |
| PacketLengthTest_pts.vbs | VBScript export of script |

## Getting Started

1. Open `PacketLengthTest.pts` in Docklight Scripting.
2. Press `Shift+F5` to start the script. It loads the project via `DL.OpenProject` (target: `ByteCounter.ptp`).

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

