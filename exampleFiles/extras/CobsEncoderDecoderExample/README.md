# COBS Encoder/Decoder

This example implements COBS (Consistent Overhead Byte Stuffing) encoding and decoding for transmit and receive sequences. It is intended for protocols that reserve delimiter bytes and need robust framing.

## Requirements

- Docklight Scripting (script-based workflow)
- Docklight can be used for project-only runs where no script is required

## Files

| File | Description |
|------|-------------|
| CobsEncoderDecoder.ptn | Project documentation (Notepad) |
| CobsEncoderDecoder.ptp | Docklight project file |
| CobsEncoderDecoder_auto.pts | Docklight Script |
| CobsEncoderDecoder_auto_pts.vbs | VBScript export of script |
| CobsEncoderDecoder_ptn.txt | Text export of documentation |
| CobsEncoderDecoder_ptp.txt | Text export of project file |

## Getting Started

1. Open `CobsEncoderDecoder.ptp` in Docklight Scripting.
2. Press `F5`. The matching `CobsEncoderDecoder_auto.pts` script is loaded automatically and started together with communication.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

