# The .docklight.md File Format

## Overview

Docklight Scripting introduces an additional project file format: `.docklight.md`. This format combines project settings, sequences, script, documentation, and program options into a single human-readable Markdown file.

The `.docklight.md` format is available in **Docklight Scripting** only (not in the smaller Docklight edition).

## Why a New Format?

The `.docklight.md` format addresses practical workflow needs for protocol development and automated testing:

- A single file replaces up to four separate files (`.ptp` + `.ptn` + `.pts` + options XML)
- Human-readable text opens in standard editors and Markdown viewers
- AI-generatable structure allows LLM-based project generation from natural-language requirements
- Git-friendly text changes produce meaningful diffs
- Self-documenting projects keep prose documentation next to sequences and settings

## What’s in a .docklight.md File?

A `.docklight.md` file can contain:

- Project overview prose (free-form Markdown)
- Communication settings (`channel1-setting`, `channel2-setting`, aliases, mode)
- Send and receive sequence lists with inline documentation
- Script section (VBScript in a fenced `vbscript` block)
- Program options (optional; when present they override user defaults)

For exact syntax, field definitions, and parser/writer rules, use the format specification referenced at the end of this guide.

## Working with .docklight.md Files

### Opening

Use **File > Open** and select a `.docklight.md` file. Docklight Scripting also accepts `.docklight.md` paths from the command line.

### Saving

**File > Save** preserves the current project format. To convert between legacy and Markdown formats, use **File > Save As** and choose the desired file type.

### Converting Existing Projects

To convert a legacy Docklight project to `.docklight.md`:

1. Open the existing `.ptp` project in Docklight Scripting.
2. If you have accompanying notes (`.ptn`) and/or script (`.pts`) files, make sure they are loaded with the project.
3. Use **File > Save As**.
4. Select `.docklight.md` as the target file type and save.

Docklight writes a single `.docklight.md` file containing the project settings, sequence data, notes/prose content, and (if present) script content.

### Command-Line Export

Docklight Scripting supports command-line export to `.docklight.md`. Example: 

`Docklight_Scripting.exe project.ptp script.pts -o output.docklight.md`

Or if three files exist, `project.ptp`, `project.ptn` (for documentation) and `project_auto.pts` (an accompanying/buddy script that is started automatically along with the project communication.): 

`Docklight_Scripting.exe project.ptp  -o output.docklight.md`

The `-o` option defines the output file path for the generated `.docklight.md` project. 

Use this to batch-convert existing `.ptp` projects (with optional `.ptn` and `.pts` files) into Markdown format for automation pipelines.

## AI-Assisted Project Creation

AI tools and large language models (LLMs) can generate valid `.docklight.md` projects from natural-language descriptions (for example, a Modbus RTU setup with specific send/receive behavior).

The format specification file `docklight-md-format-spec.md` provides the reference context an AI tool needs to generate or modify projects correctly.

## Backward Compatibility

Traditional Docklight project workflows (`.ptp`, `.ptn`, `.pts`) remain fully supported. The `.docklight.md` format is an alternative project representation supported by Docklight Scripting, specifically targeted for AI and automation uses. It is not a replacement.

## Format Specification and Examples

For the complete technical specification, see `docklight-md-format-spec.md` in the Docklight installation directory.

Canonical `.docklight.md` examples are included in the `ScriptSamples` folder and documented in `/ScriptSamples/markdown/docklight-md-examples/docklight-md-examples-README.md`.

## Meta 

**Author:** oliver.heggelbacher@kickdrive.de 
**Document Version:** 0.3 
**Last Updated:** 
2026-02-25