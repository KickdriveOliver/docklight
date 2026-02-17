# Generic Receive Sequences

This example recognizes receive data patterns and triggers scripted responses through generic receive sequence handling. It is useful for building flexible parser-driven automation.

## Requirements

- Docklight Scripting (uses UDP/local network channel settings)

## Files

| File | Description |
|------|-------------|
| GenericReceiveSequences_Demo.ptn | Project documentation (Notepad) |
| GenericReceiveSequences_Demo.ptp | Docklight project file |
| GenericReceiveSequences_Demo_ptn.txt | Text export of documentation |
| GenericReceiveSequences_Demo_ptp.txt | Text export of project file |

## Getting Started

1. Open `GenericReceiveSequences_Demo.ptp` in Docklight Scripting.
2. Keep or adjust the UDP endpoint settings for your test setup, then press `F5`.
3. Send test telegrams to trigger the generic receive rules (`AnyCharacter`, `AnyTelegramWithPause`, `AnyLineWithCR`).

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

