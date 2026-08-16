# username/project

Replace this paragraph with the project-specific guidance that AI agents need before modifying the repository.

## Language Rules

- Use English by default for source code, configuration, documentation, and other repository-recorded artifacts.
- Replace or extend these rules when the copied project has additional language requirements.

## Required MoonBit Skills

Always consult the relevant MoonBit skills from [`totto2727-coding`](https://github.com/totto2727-org/agent/tree/main/plugins/totto2727-coding): read [`mbt-coding`](https://github.com/totto2727-org/agent/blob/main/plugins/totto2727-coding/skills/mbt-coding/SKILL.md) before editing MoonBit production code, read [`mbt-test`](https://github.com/totto2727-org/agent/blob/main/plugins/totto2727-coding/skills/mbt-test/SKILL.md) before editing MoonBit tests, and use [`docs-moonbit`](https://github.com/totto2727-org/agent/blob/main/plugins/totto2727-coding/skills/docs-moonbit/SKILL.md) when the MoonBit language reference is needed.

## Repository Structure

- `moon.mod` defines the module metadata, repository, native target, and source root.
- `src/main.mbt` contains the command-line application entry point.
- `src/moon.pkg` declares the executable package and supported target.
- `package.nix` defines the installable Nix package.
- `flake.nix` and `flake.lock` expose the package and overlay while pinning the MoonBit toolchain and other Nix-provided tools.
- `.github/workflows/` contains validation and optional publishing workflows.

## Development Commands

Run commands from the repository root inside the Nix development shell.

### Execution Rules

- Run MoonBit commands from the repository root.
- Enter the environment with `nix develop` before running project commands.

### Standard Tasks

```bash
nix develop
moon info
moon check
moon test
moon run src
moon package --list
nix build .#project
nix run .
```

## Package Updates

When upgrading a package, always run `nix flake update`.

## Target Policy

Keep `supported_targets` and `preferred_target` in `moon.mod`, `supported_targets` in `src/moon.pkg`, and the build target in `package.nix` aligned with the application's APIs and dependency support.

## Architecture and Conventions

Replace this section with the copied project's source layout, public boundaries, naming rules, and other repository-specific constraints.

## Development Tools

- **MoonBit** - builds, checks, tests, and runs the command-line application.
- **Nix flakes** - build and expose the package and overlay while pinning the MoonBit toolchain and other Nix-provided tools.
