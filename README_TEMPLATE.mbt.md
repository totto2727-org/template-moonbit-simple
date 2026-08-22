# username/project

Replace this paragraph with a concise description of what the command-line application does, who it serves, and why someone would use it.

## Usage

Prefer a `moonx` example with no runner options. Add `--target native` only when the published package is native-only.

```console
$ moonx username/project
Replace this output.
```

## Key features

- Replace this item with a user-visible capability.
- Replace this item with another user-visible capability.
- Replace this item with another user-visible capability.

## Prerequisites

- **MoonBit or Nix**: Replace this text with the minimum MoonBit toolchain requirement, or require Nix with flakes enabled for the Nix paths.

## Setup

1. Show direct execution without installation.

```bash
moonx username/project
nix run github:username/project
```

2. Show installation with MoonBit and Nix.

```bash
moon install username/project
nix profile install github:username/project
```

3. Show declarative installation through the project's overlay in `flake.nix`.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    project.url = "github:username/project";
  };

  outputs = { nixpkgs, project, ... }:
    let
      system = "aarch64-darwin"; # Replace with a supported host system.
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ project.overlays.default ];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.project ];
      };
    };
}
```

## API

### `project`

Replace this text with the command's accepted arguments and options, standard output, standard error, exit statuses, and failure conditions.

```console
$ project --help
Replace this output.
```

## Development

For project structure and development commands, see [AGENTS.md](./AGENTS.md).

## License

[MIT](./LICENSE)

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
