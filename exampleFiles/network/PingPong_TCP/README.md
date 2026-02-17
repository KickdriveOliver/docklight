# Ping-Pong over TCP

This demo shows bidirectional TCP client/server communication between two Docklight instances on localhost. Start the server project first, then launch the client project and send Ping sequences to verify round-trip behavior.

## Requirements

- Docklight Scripting (network/HID/named-pipe examples are intended for Docklight Scripting)

## Files

| File | Description |
|------|-------------|
| PingPong_TCP.pts | Docklight Script |
| PingPong_TCP_Client.ptp | Docklight project file |
| PingPong_TCP_Client_log_asc.htm | Example asset |
| PingPong_TCP_Client_ptp.txt | Text export of project file |
| PingPong_TCP_pts.vbs | VBScript export of script |
| PingPong_TCP_Server.ptn | Project documentation (Notepad) |
| PingPong_TCP_Server.ptp | Docklight project file |
| PingPong_TCP_Server_log_asc.htm | Example asset |
| PingPong_TCP_Server_ptn.txt | Text export of documentation |
| PingPong_TCP_Server_ptp.txt | Text export of project file |

## Getting Started

1. Open `PingPong_TCP.pts` in Docklight Scripting.
2. Press `Shift+F5` to start the script. It loads the project via `DL.OpenProject` (target: `PingPong_TCP_Server.ptp`).

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*


