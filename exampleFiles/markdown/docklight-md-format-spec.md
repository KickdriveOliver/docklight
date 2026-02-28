# Docklight All-in-One Markdown Format Specification (`.docklight.md`)

> **AI Usage:** This specification is designed as direct context for LLMs generating or modifying `.docklight.md` files. The appendices provide quick-reference tables for checksums, COMMENT format specifiers, and channel types.

## 1) Overview

This document defines format version 1 of Docklight's unified project file format.

- **File extension:** `.docklight.md`
- **Primary goal:** Human-readable and AI-generatable project files with full round-trip semantic fidelity — editable in any text editor or AI tool outside Docklight Scripting. Fully supported for loading, saving, editing, and execution within Docklight Scripting.
- **Compatibility goal:** Full backward compatibility with legacy `.ptp`, `.ptn`, `.pts`, and optional options XML workflows
- **Write encoding:** UTF-8 without BOM
- **Write line endings:** CRLF (`\r\n`)
- **Read tolerance:** CRLF and LF

## 2) File Identity and Version

A valid file MUST begin with the Docklight title marker:

```markdown
# DOCKLIGHT:
```

Immediately after title, add:

```markdown
format-version: 1
```

Notes:
- Detection is **case-insensitive** (`# docklight:` is accepted by parser)
- Title does **not** carry project name (project name comes from filename)
- If `format-version` is missing, parser assumes `1` and reports a warning

## 3) Section Markers and Structure

Top-level Docklight sections use Markdown H2 headings:

```markdown
## DOCKLIGHT: <Section Name>
```

Supported section headings:

- `## DOCKLIGHT: Communication Settings`
- `## DOCKLIGHT: Send Sequence List`
- `## DOCKLIGHT: Receive Sequence List`
- `## DOCKLIGHT: Script`
- `## DOCKLIGHT: Program Options`

Behavior:
- All sections are optional
- Any section order is accepted on read
- Canonical write order:
  1. Communication Settings
  2. Send Sequence List
  3. Receive Sequence List
  4. Script
  5. Program Options
- Unknown `## DOCKLIGHT:` sections are preserved as raw text for round-trip
- Non-Docklight Markdown headings are treated as prose, not structural markers

## 4) General Parsing Rules

### 4.1 Keyword line format

Structured lines use:

```text
key: value
```

Rules:
- Keys are case-insensitive on read
- Canonical writer output is lowercase-hyphenated keywords
- Values are single-line
- Duplicate keys in same scope are allowed; **last value wins**

### 4.2 Keyword recognition and prose handling

**Keyword line syntax:**
A line is recognized as a keyword line **only if** it matches the pattern:

```
^[a-z][a-z0-9.-]*:( .+)?$
```

That is:
- Starts with a lowercase letter
- Followed by zero or more lowercase letters, digits, hyphens, or dots
- Followed by a colon
- Optionally followed by a space and value (value may be empty)

A keyword with no value (e.g. `checksum:` or `comment:`) is valid and represents an empty string value.

**Examples of valid keywords:**
- `data: 01 06 01 02 00 07 00 00`
- `repeat-active: false`
- `checksum-validation: 0`
- `channel1-setting: COM1:9600,NONE,8,1,OFF`
- `checksum:` — empty value (no checksum configured)
- `comment:` — empty value (no comment action)
- `channel1-alias:` — empty value (no alias)

**Examples that are NOT keywords (treated as prose):**
- `TIP: For a more elaborate...` — uppercase letters before colon
- `Example transmission:` — uppercase letter in key, contains space
- `01 Address = 1` — starts with digit
- `Sequence Definition:` — contains space before colon

**Parsing rules:**
1. After a `## DOCKLIGHT:` or `### DOCKLIGHT:` heading, check each line
2. Blank lines are skipped (don't affect keyword/prose mode)
3. Lines matching the keyword pattern are parsed as `key: value`
4. Once a non-blank line does **not** match the keyword pattern, it's prose from now on. 
5. All remaining lines in that section are prose (no more keyword parsing)
6. Prose continues until the next DOCKLIGHT heading or end-of-file

### 4.3 Inline `#` comments

`#` inline comments are allowed for numeric keyword values:

```text
communication-mode: 1  # Monitoring
reaction: -1  # (none)
```

Parser behavior: parse text before `#`, trim whitespace, ignore comment tail.

For text payload fields (`data`, `checksum`, `comment`), `#` is part of the value and not treated as numeric comment syntax.

### 4.4 Validation strategy

- Parser is intentionally lenient
- Malformed keyword lines are skipped with warnings
- Parse continues instead of aborting

## 5) Project Overview Prose

Project overview prose is implicit content between:

1. `# DOCKLIGHT:` / `format-version: 1`
2. The first `## DOCKLIGHT:` section heading

This maps to the existing project documentation storage (`rtfDocNotepadPart`).

## 6) Communication Settings Section

Heading:

```markdown
## DOCKLIGHT: Communication Settings
```

### 6.1 Keywords

| Keyword | Type | Meaning |
|---|---|---|
| `communication-mode` | integer | Communication mode (Docklight internal mode enum) |
| `communication-filter` | integer | Display filter (`0=all`, `1=TX`, `2=RX`, `3=comments`) |
| `channel1-setting` | string | Channel 1 settings string (`DL.SetChannelSettings` syntax) |
| `channel2-setting` | string | Channel 2 settings string (`DL.SetChannelSettings` syntax) |
| `channel1-alias` | string | Optional user alias |
| `channel2-alias` | string | Optional user alias |

`channelX-setting` follows Docklight DL.SetChannelSettings / DL.GetChannelSettings string format for "newSettings"

### 6.3 Channel setting serialization rules

- Serial settings suffix (`:baud,parity,databits,stopbits,flow,parerr[,versatap]`) is written **only** for serial channels:
  - `COM...`
  - `TAP...`
  - `VTP...`
- Non-serial channels (for example `SERVER:10001`, `192.168.2.100:10001`, `UDP:...`, `PIPE:...`, `USBHID:...`) are written without serial suffix.
- Reader tolerance: parser may accept and recover from legacy/wrong files that append serial suffix to non-serial channels.
- Docklight internally uses one shared COM/serial setting set. If both channel lines specify different serial suffix values, the parser accepts this for compatibility and the **last parsed** line wins.
- Canonical writer output mirrors Docklight UI behavior: when both channels are serial-capable, one shared COM/serial tuple is emitted for both channels.
### 6.2 Legacy mapping

- `.ptp` `COMMSETTINGS` fields map to `communication-mode`, `channel1-setting`, `channel2-setting`
- `.ptp` `COMMDISPLAY` maps to `communication-filter`
- `.ptp` `CHANNELALIAS` maps to `channel1-alias`, `channel2-alias`
- `.ptp` `VERSATAP` is represented through channel settings conventions

## 7) Send Sequence List

Heading:

```markdown
## DOCKLIGHT: Send Sequence List
```

per-"Send Sequence" heading format:

```markdown
### DOCKLIGHT: Send N: <Name>
```

### 7.1 Send Sequence keywords

| Keyword | Type | Meaning |
|---|---|---|
| `data` | hex-string | Sequence payload in Docklight hex text format |
| `repeat-active` | boolean | Repeat enabled (`true`/`false`) |
| `repeat-interval` | integer | Repeat interval in seconds |
| `checksum` | string | Checksum spec string (verbatim syntax) |

Rules:
- `data` is mandatory for data-carrying sequence entries (empty Send Sequence allowed by parser)
- Canonical write format is space-separated hex pairs
- Hex parsing reuses `ClSequence.parseText(MODE_HEXA, ...)`

### 7.2 Special hex tokens

These are valid inside `data`:
- `??` wildcard byte
- `##` zero-wildcard token
- `&&` timing mark token

## 8) Receive Sequence List

Heading:

```markdown
## DOCKLIGHT: Receive Sequence List
```

Per-"Receive Sequence" heading format:

```markdown
### DOCKLIGHT: Receive N: <Name>
```

### 8.1 Receive Sequence keywords

| Keyword | Type | Meaning |
|---|---|---|
| `data` | hex-string | Receive Sequence match pattern |
| `reaction` | integer | Auto-answer Send Sequence index (`-1` = no action) |
| `activated` | boolean | Detection active flag |
| `comment` | string | COMMENT action string |
| `linebreak` | boolean | Add line break after comment |
| `trigger` | boolean | Snapshot trigger flag |
| `stop-comm` | boolean | Stop communication on match |
| `timestamp` | boolean | Add timestamp after comment |
| `checksum` | string | Checksum spec string |
| `checksum-validation` | integer | Validation mode (`0=on match`, `1=on mismatch`, `2=always`) |

## 9) Checksum Specification

`checksum:` value uses existing Docklight checksum spec syntax verbatim.

### 9.1 Accepted checksum identifiers

From `ClChecksumCalc`:

- `MOD256`
- `MOD65536`
- `XOR`
- `LRC`
- `LRC-ASCII`
- `CRC-7`
- `CRC-8`
- `CRC-DOW`
- `CRC-CCITT`
- `CRC-16`
- `CRC-MODBUS`
- `CRC-XMODEM`
- `CRC-32`
- Generic `CRC:<width>,<poly>,<init>,<xor>,<refIn>,<refOut>`

### 9.2 Placement/range syntax

Examples:

```text
checksum: CRC-MODBUS L # MODBUS RTU checksum. Lower Byte first ('Little Endian')
checksum: (3, -3) CRC-MODBUS L # Range-limited checksum over payload subset
checksum: (2, -5) LRC-ASCII A @ -4 # ASCII-LRC with explicit result position
```

`L` and `A` flags and optional `@ <position>` placement are preserved as existing checksum grammar.

## 10) COMMENT Action Specification

`comment:` contains raw Docklight COMMENT expression.

Supported format specifiers include:

- `%_L` line break
- `%_H(start,len)` extract bytes in hex
- `%_D(start,len)` extract bytes as decimal

Example:

```text
comment: %_LDetected Modbus Frame = %_H(3,-1)%_LSlaveID=%_H(3,1)%_LFunctionCode=%_H(4,1)%_LAddr/Data=%_H(5,-3)%_LCRC=%_H(-2,-1)
```

## 11) Script Section

Heading:

```markdown
## DOCKLIGHT: Script
```

Structure:

```markdown
script-version: 1
script-autostart: false

```vbscript
' script body here
```
```

`script-autostart` is optional on read and canonical on write (`true`/`false`).

- `script-autostart: true` means F5 (Start Communication) also starts the embedded script automatically, equivalent to classic `<project>_auto.pts` behavior.
- `script-autostart: false` keeps script start manual (Shift+F5/F8).

Import rule from `.pts`:
- Strip 3-line `.pts` file header (`DL_SCRIPTVERSION`, version number, build marker)
- Store version as `script-version`
- Store body in fenced `vbscript` code block

## 12) Program Options Section

Heading:

```markdown
## DOCKLIGHT: Program Options
```

Format:

```text
Group.Key: value
```

Rules:
- Optional section
- If present, write all supported options (all-or-nothing section)
- Group names and key names follow Docklight internal naming.
- Booleans are `true`/`false`
- Colors are `#RRGGBB`
- No `#` inline comments in this section
- Excluded keys: `LogHTMLHeader`, `LogHTMLFooter`, `LogHTMLDataElement`

Example keys:

- `Colors.DispBack: #FFFFFF`
- `TextSetup.DispFontSize: 10`
- `Stamp.Date: true`
- `LogFile.ASCII: true`
- `Expert.ExpertNoDataForwarding: false`

## 13) Writer Canonicalization Rules

Writer canonical output behavior:

- Emit all defined properties explicitly
- Write keywords before prose in each sequence subsection
- Preserve prose text content
- Collapse multiple adjacent blank lines to one in canonical output
- Preserve unknown `## DOCKLIGHT:` sections and their relative positions

## 14) Round-Trip Semantics

Round-trip target is **semantic equivalence**, not byte-for-byte equality:

- Same project meaning and values after parse/write
- Same sequence ordering semantics (file order)
- Same checksum/comment/data semantics
- Prose preserved as text; whitespace formatting may normalize

## 15) Minimal Valid Files

Both examples below are complete file contents and can be saved directly as `.docklight.md` files.

### 15.1 Absolute minimum

```markdown
# DOCKLIGHT:
format-version: 1
```

### 15.2 Practical ~10-line minimum

```markdown
# DOCKLIGHT:

format-version: 1

## DOCKLIGHT: Send Sequence List

### DOCKLIGHT: Send 1: Hello World

data: 48 65 6C 6C 6F
```

## 16) Requirement Coverage (Phase 1 SPEC-01..SPEC-16)

| Requirement | Coverage in this spec |
|---|---|
| SPEC-01 | `## DOCKLIGHT:` section marker grammar |
| SPEC-02 | `# DOCKLIGHT:` required title marker (project name intentionally omitted per locked decision) |
| SPEC-03 | `format-version: 1` definition |
| SPEC-04 | Communication Settings section + key mapping |
| SPEC-05 | Send Sequence List + subsection heading format |
| SPEC-06 | Receive Sequence List + subsection heading format |
| SPEC-07 | Send Sequence keys (`data`, repeat, checksum) |
| SPEC-08 | Receive Sequence keys including comment/reaction/flags/checksum-validation |
| SPEC-09 | `??`, `##`, `&&` token handling |
| SPEC-10 | COMMENT format specifier rules |
| SPEC-11 | Script section with fenced `vbscript` block |
| SPEC-12 | Program Options key-value section |
| SPEC-13 | Project Overview prose region |
| SPEC-14 | Per-sequence prose support |
| SPEC-15 | Minimal valid file forms |
| SPEC-16 | Structured keyword+prose hybrid approach |

---

This specification is the authoritative v1 format reference for `.docklight.md`.

## Appendix A: Receive Sequence COMMENT Format

`comment:` is a Receive Sequence action. When the Receive Sequence is detected, Docklight outputs formatted text based on literal text plus the comment macros listed below.

### A.1 Receive Sequence comment macros

| Macro | Replaced by | Notes |
|---|---|---|
| `%_S` | Trigger BELL signal (beep) | Uses Windows sound scheme |
| `%_L` | Insert line break | Starts a new output line |
| `%_T` | Insert receive timestamp | Timestamp of the detected data (complete sequence) |
| `%_C` | Insert channel/direction number | Usually `1` or `2` |
| `%_X` | Insert channel name/alias | corresponds to the channel number `%_C` |
| `%_I` | Insert Receive Sequence list index | Index from Receive Sequence List |
| `%_N` | Insert Receive Sequence name | Name from sequence definition |
| `%_A` | Insert matched receive data as ASCII | Includes the actual data that matched the wildcard areas |
| `%_H` | Insert matched receive data as HEX | Full matched data |
| `%_D` | Insert matched receive data as decimal | Full matched data |
| `%_B` | Insert matched receive data as binary | Full matched data |
| `%_A(start,len)` | Insert ASCII subset of matched data | Extended range syntax |
| `%_H(start,len)` | Insert HEX subset of matched data | Extended range syntax |
| `%_D(start,len)` | Insert decimal subset of matched data | Extended range syntax |
| `%_B(start,len)` | Insert binary subset of matched data | Extended range syntax |

Range semantics for `(...start,len)` forms:
- Negative `start` counts from end (`-1` = last byte)
- Negative `len` means “to end minus N” (`-1` includes last byte, `-2` excludes last byte)

### A.2 Worked examples

**Example 1 — Modbus frame parsing**

- Receive match:

```text
data: 01 04 ?? ?? ?? ?? ??
```

- COMMENT string:

```text
comment: %_LDetected Modbus Frame = %_H(3,-1)%_LSlaveID=%_H(1,1)%_LFunctionCode=%_H(2,1)
```

- Incoming hex data:

```text
01 04 02 04 01 7A 30
```

- Docklight display:

```text
Detected Modbus Frame = 02 04 01 7A 30
SlaveID=01
FunctionCode=04
```

**Example 2 — Decimal value extraction**

- COMMENT string:

```text
comment: Temperature=%_D(3,2) degrees
```

- Incoming hex data starts with:

```text
01 03 02 00 FF ...
```

- Docklight display:

```text
Temperature=255 degrees
```

For complete COMMENT macro reference, see https://docklight.de/manual/receivesequencewildcard.html#commentmacros

## Appendix B: Checksum Specification Quick Reference

### B.1 Supported checksum identifiers

| Identifier | Description |
|---|---|
| `MOD256` | Modulo-256 sum |
| `MOD65536` | Modulo-65536 sum |
| `XOR` | Byte-wise XOR |
| `LRC` | Longitudinal redundancy check |
| `LRC-ASCII` | LRC over ASCII hex characters |
| `CRC-7` | 7-bit CRC (SD card) |
| `CRC-8` | 8-bit CRC |
| `CRC-DOW` | Dallas 1-Wire CRC |
| `CRC-CCITT` | CRC-CCITT (`0xFFFF` init) |
| `CRC-16` | CRC-16 (`0x0000` init) |
| `CRC-MODBUS` | CRC-16/Modbus (`0xFFFF` init, reflected) |
| `CRC-XMODEM` | CRC-XMODEM (`0x0000` init) |
| `CRC-32` | CRC-32 (Ethernet/ZIP) |
| `CRC:<width>,<poly>,<init>,<xor>,<refIn>,<refOut>` | Generic CRC parameterized definition |

### B.2 Placement flags and range syntax

- Placement flags:
  - `L` = little-endian placement (lower byte first)
  - `A` = ASCII placement
  - `H` = default/big-endian placement
- Range syntax: `(start, end)` limits checksum calculation to a subset of the data
- Placement position: `@ position` defines where the result is inserted

### B.3 Worked examples

**Example 1 — CRC-MODBUS over bytes 1..6**

```text
checksum: CRC-MODBUS L
```

Given data:

```text
01 06 01 02 00 07 00 00
```

Docklight calculates CRC over bytes 1-6. Result is `68 34`, written little-endian at bytes 7-8.

Transmitted frame:

```text
01 06 01 02 00 07 68 34
```

**Example 2 — Range-limited CRC-MODBUS**

```text
checksum: (3, -3) CRC-MODBUS L
```

This computes CRC only for the payload subset (starting at byte 3 and ending 3 bytes before the end), which is useful for framed protocols with header and trailing bytes outside the checksum range.

For complete checksum specification, see https://docklight.de/manual/checksum_specification.html

## Appendix C: Communication Channel Types

| Channel Type | `channel1-setting` Syntax | Example |
|---|---|---|
| COM (serial port) | `COMn:baud,parity,databits,stopbits,flow,parerr` | `COM1:9600,NONE,8,1,RTSCTS,63` |
| TCP Client | `host:port` | `192.168.2.100:10001` |
| TCP Server | `SERVER:port` | `SERVER:10001` |
| TCP Server (proxy behavior) | `PROXY:localport` | `PROXY:10001` |
| UDP peer | `UDP:host:port` | `UDP:LOCALHOST:10001` |
| UDP server | `UDP:port` | `UDP:10001` |
| Named Pipe | `PIPE:name` | `PIPE:mynamedpipe` |
| USB HID | `USBHID:vid:pid` | `USBHID:1234:5678` |
| TAP (Docklight Tap) | `TAPn:baud,parity,databits,stopbits,flow` | `TAP0:9600,EVEN,8,1,OFF,63` |
| VTP (Tap Pro / 485) | `VTPn:baud,parity,databits,stopbits,flow,tap485volt` | `VTP0:115200,NONE,8,2,OFF,63,1` |

Notes:
- Serial suffix (`:baud,parity,...`) applies only to COM, TAP, and VTP channels. Non-serial channels omit it.
- When using two channels with serial communication settings (COM, TAP, or VTP), the serial line parameters (for example `9600,NONE,8,1,OFF,63`) should be the same for both channels.
- `LOCALHOST` is accepted as alias for `127.0.0.1`.
- `tap485volt` is an additional Docklight Tap 485 / VersaTap setting: `0 = RS232_TTL`, `1 = RS422_RS485`, `2 = Inverted_RS232_TTL`.
- `PROXY`, `TAP`, and `VTP` are fully supported. The linked SetChannelSettings page currently focuses on serial settings and will be updated.

For serial port parameter details, see https://docklight.de/manual/dl_setchannelsettings.html

## Meta 

**Author:** oliver.heggelbacher@kickdrive.de 
**Document Version:** 0.3 
**Last Updated:** 
2026-02-24
