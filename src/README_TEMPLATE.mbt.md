# username/project

Replace this paragraph with a concise description of what the MoonBit library does, who it serves, and why a consumer would use it.

This document is canonical `README.mbt.md`; maintain `README.md` as the relative symlink `README.md -> README.mbt.md`.

## Usage

Replace this checked example with the copied project's primary public API.

```mbt check
///|
test {
  inspect(@project.add(2, 3), content="5")
}
```

## Key features

- Replace this item with a user-visible capability.
- Replace this item with another user-visible capability.
- Replace this item with another user-visible capability.

## Prerequisites

- **MoonBit**: Replace this text with the minimum supported toolchain or runtime requirement.

## Setup

1. Add the package to a MoonBit project.

```bash
moon add username/project
```

## API

### `add`

Replace this text with the caller-visible behavior, constraints, and failure contract of the public API.

Before handoff, inspect the Mooncakes registry first. Use its maintained API index when one exists; otherwise document every public declaration inline or link a substantive existing API guide. Remove this sample subsection when it is not part of the copied project's public API.

```mbt check
///|
test {
  inspect(@project.add(2, 3), content="5")
}
```

## Development

For project structure and development commands, see [AGENTS.md](../AGENTS.md).

## License

[MIT](../LICENSE)

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
