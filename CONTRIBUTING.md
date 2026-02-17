# Contributing to Docklight Examples

Thanks for helping improve the Docklight (www.docklight.de) examples repository.

## Scope

This repository contains communication examples and documentation for Docklight and Docklight Scripting.

## Proposing a New Example

Open an issue with:
- Target device/protocol (for example RS232, TCP, UDP, USB HID)
- Primary use case and expected workflow
- Hardware requirements (or simulator availability)
- Desired files/assets (project, script, sample data, screenshots)

## Example Folder Requirements

Each contributed example folder should include:
- `README.md` with description, requirements, files table, and getting started steps
- Runnable Docklight assets (`.ptp`, `.pts`, `.ptn` where applicable)
- Any sample data files needed to run the scenario

## Naming and Documentation Conventions

- Keep existing directory naming patterns consistent with the repository.
- Use concise file descriptions in README file tables.
- Prefer relative links for cross-references inside the repository.
- Note hardware/setup clearly, including COM/TCP/UDP/HID settings.

## Pull Request Checklist

Before opening a PR, confirm:
- [ ] Example runs as described
- [ ] `README.md` exists and matches repository format
- [ ] File table reflects actual folder contents
- [ ] No `.zip` archives are added
- [ ] Changes are scoped to examples/documentation

## Reporting Issues

Use the issue templates for:
- Bug reports
- New example requests

For product support questions unrelated to this repository, contact support@docklight.de.
