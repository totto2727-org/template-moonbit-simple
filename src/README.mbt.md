# MoonBit Simple Library Template

A GitHub repository template for starting a small MoonBit library with reproducible Nix tooling, executable usage examples, continuous integration, and optional Mooncakes or FlakeHub publishing.

This document is canonical `README.mbt.md`; maintain `README.md` as the relative symlink `README.md -> README.mbt.md`.

## Usage

Create a repository from the template, replace the module placeholders, and use the included `add` function as the starting public API:

```mbt check
///|
test {
  inspect(@project.add(2, 3), content="5")
}
```

## Key features

- MoonBit library layout with a documented public function and focused test
- Canonical `README.mbt.md` with a relative `README.md` symbolic link
- Reproducible Nix development shell with the MoonBit toolchain
- Continuous integration for the supported MoonBit targets
- Optional Mooncakes and FlakeHub publishing workflows
- Copy-target README and AGENTS templates that follow the share-artifact specification

## Prerequisites

- **GitHub CLI** (optional): Run the documented creation command; GitHub's **Use this template** flow can be used instead.
- **Nix**: Enter the pinned development environment.

## Setup

1. Create and clone a repository from the template with GitHub CLI, or use GitHub's **Use this template** flow and clone it normally.

```bash
gh repo create username/project --template totto2727-org/template-moonbit-simple --public --clone
```

2. Enter the repository.

```bash
cd project
```

3. Complete the documentation, module, target, and optional publishing conversion steps in [AGENTS.md](../AGENTS.md).

## API

### `add`

Returns the sum of two `Int` values and provides a minimal public function to replace when starting the copied library.

```mbt check
///|
test {
  inspect(@project.add(-2, 5), content="3")
}
```

## Development

For template conversion, target policy, project structure, and development commands, see [AGENTS.md](../AGENTS.md).

## License

[MIT](../LICENSE)

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
