# Docklight Project Generator

This command-line utility generates Docklight .ptp project files from HEX log input. It includes a compiled executable, sample input logs, and generated output for reference.

## Requirements

- Docklight
- Optional second Docklight instance if you use the generated simulator project for two-instance testing

## Files

| File | Description |
|------|-------------|
| DocklightProjectGen.exe | Executable utility |
| fuh_distribute_support_int.txt | Text export or notes |
| modemlog_hex.txt | Text export or notes |
| modemsimulator.ptp | Docklight project file |
| modemsimulator_ptp.txt | Text export of project file |
| pad_file.xml | Example asset |
| readme.txt | Text export or notes |

## Getting Started

1. Run `DocklightProjectGen.exe modemlog_hex.txt modemsimulator.ptp` to generate/update the sample project from the log data.
2. Open `modemsimulator.ptp` in Docklight and press `F5` to run the generated responses.
3. The main example in this folder is the project generator workflow (`DocklightProjectGen.exe`); `modemsimulator.ptp` is a helper simulator project for testing another main project without hardware.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*

