# Docklight Markdown (.docklight.md) Example Files

These example files demonstrate the `.docklight.md` format across different use cases and feature areas. Each file can be opened directly in Docklight Scripting.

For the format specification, see `../docklight-md-format-spec.md` and `../docklight-md-user-guide.md`.

## Example Files

### 1. Minimal.docklight.md
**Purpose:** Absolute minimum valid `.docklight.md` file (~10 lines)  
**Features:** `# DOCKLIGHT:` header, `format-version`, single send sequence  
**Use case:** Starting point for new projects; demonstrates defaults-on-omission

### 2. ModbusRtuCrc.docklight.md
**Purpose:** Modbus RTU command/monitoring example with CRC checksums and frame parsing  
**Features:** COM serial channel, `CRC-MODBUS` checksum (including range syntax), receive sequences with COMMENT actions (`%_H`, `%_D`, `%_L`), `??` wildcards, `&&` timing marks, script section, program options, rich prose documentation  
**Use case:** Industrial protocol testing with automatic CRC calculation and response parsing

### 3. XenaxProtocolEmulator.docklight.md
**Purpose:** TCP device emulator with reaction-based auto-replies  
**Features:** TCP server channel (`SERVER:10001`), large send/receive sequence lists, receive reactions, event scripting (`DL_OnReceive`, `DL_OnSend`), `##` wildcard usage in protocol matching, `&&` timing marks, channel aliases  
**Use case:** Protocol emulation / device simulation for integration and regression testing

### 4. crc_reverse_engineering_crc_finder.docklight.md
**Purpose:** CRC reverse-engineering tool using brute-force CRC parameter search  
**Features:** UDP channel (`UDP:LOCALHOST:10001`), advanced scripting (`DL.CalcChecksum`, `DL.OnSend_Poke`, `InputBox`), rich inline prose documentation, program options  
**Use case:** Automated CRC parameter discovery and advanced scripting patterns

### 5. TestRunner.docklight.md
**Purpose:** CSV-driven automated protocol test runner  
**Features:** TCP client channel (`LOCALHOST:10001`), scripting with `FileInput`/`FileOutput`, `DL.ShellRun`, `DL_OnReceive` event, `##` wildcard receive pattern, program options  
**Use case:** Automated protocol verification and CI-style regression testing

### 6. automated_loopback_test.docklight.md
**Purpose:** Command-line driven automated testing — no external hardware required  
**Features:** Command-line execution via `Docklight_Scripting.exe -r automated_loopback_test.docklight.md`. UDP loopback channel (`UDP:LOCALHOST:10001`) for self-contained testing. `DL.StartLogging` writes a text log file for post-run evaluation. `DL.SendSequence` and `DL.WaitForSequence` for send/receive verification. Receive Sequence COMMENT string adds "PASS - device command reaction OK" to log output. `DL.Quit` for clean exit. The companion PowerShell script `automated_loopback_test_run_me.ps1` demonstrates how to run this loopback test and evaluate the resulting log file.
**Use case:** Automated workflow / agentic workflow / verification tests / CI-style regression testing

## Feature Coverage Matrix

| Feature | Minimal | ModbusRTU | XenaxEmulator | CRC Finder | TestRunner | LoopbackTest |
|---|---|---|---|---|---|---|
| COM serial | — | ✓ | — | — | — | — |
| TCP server | — | — | ✓ | — | — | — |
| TCP client | — | — | — | — | ✓ | — |
| UDP | — | — | — | ✓ | — | ✓ |
| Checksum | — | CRC-MODBUS | — | via script | — | — |
| COMMENT actions | — | ✓ (rich) | — | — | — | ✓ |
| Wildcards (`??`) | — | ✓ | — | — | — | — |
| Wildcards (`##`) | — | — | ✓ | — | ✓ | ✓ |
| Timing marks (`&&`) | — | ✓ | ✓ | — | — | — |
| Script | — | ✓ | ✓ (events) | ✓ (advanced) | ✓ (file I/O) | ✓ (CLI/logging) |
| Program options | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| Prose documentation | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| Receive reactions | — | — | ✓ | — | — | — |
| Command-line (`-r`) | — | — | — | — | — | ✓ |
| Log file evaluation | — | — | — | — | — | ✓ |
| `DL.Quit` | — | — | — | — | — | ✓ |
