# username/project

## Repository structure

```text
.github/workflows/  Validation and publishing workflows
README.mbt.md       Relative symbolic link to src/README.mbt.md
README.md           Relative symbolic link to README.mbt.md
flake.nix           Reproducible development environment
moon.mod            Module metadata, repository, and target policy
src/                Library implementation, canonical README, package configuration, and tests
```

Replace the sample paths with the copied project's actual package and test layout.

## Development commands

### Execution rules

- Run commands from the repository root.
- Enter the environment with `nix develop` before running MoonBit commands.
- Read the `mbt-coding` skill before editing MoonBit production code, the `mbt-test` skill before editing MoonBit tests, and `docs-moonbit` when language-reference guidance is needed.
- Keep `README.md -> README.mbt.md -> src/README.mbt.md` as relative symbolic links; never replace them with independently authored files.

### Standard tasks

- `nix develop` — Enter the pinned MoonBit development environment.
- `moon info` — Regenerate package interface information after public API changes.
- `moon check` — Type-check all packages.
- `moon test` — Run all package and documentation tests discovered under the configured source root.
- `moon check README.mbt.md` — Type-check the canonical README examples through its package-local target.
- `moon test README.mbt.md` — Run the canonical README tests through its package-local target.
- `moon package --list` — Confirm the packages that will be published.

## Architecture

### Package boundaries

- Replace this item with the copied project's package ownership and dependency direction.
- Keep public declarations documented with caller-visible behavior, constraints, and errors.
- Inspect the Mooncakes registry first and use its maintained API index when one exists; only otherwise use complete inline coverage or a substantive existing guide.

### Target policy

- Leave `supported_targets` and `preferred_target` unset for a synchronous, backend-neutral library.
- For an async library, enable `supported_targets = "+native+js+wasm"` and choose the first viable preferred target in this order: `wasm`, `js`, then `native`.
- Narrow both settings when a dependency supports fewer targets.
- Include `pkgs.nodejs` in the Nix development shell when `preferred_target = "js"`.

## Development tools

- **MoonBit**: Checks, tests, documents, and packages the project.
- **Nix flakes**: Pin the MoonBit toolchain and supporting dependencies.
- **GitHub Actions**: Validate and publish the repository.

## Package-specific rules

- Replace this section with repository-specific invariants and remove placeholder guidance before handoff.
- Keep publishing workflows disabled until every mutable `uses:` reference in each privileged publishing workflow is pinned to an audited full commit SHA.
- Store the base64-encoded Mooncakes credentials file in `MOONCAKES_TOKEN`. After pinning action references, validate with `moon publish --dry-run` in a protected environment, then enable publication by renaming `publish.yml.disabled` to `publish.yml`; otherwise delete the disabled file.
- Before enabling FlakeHub publication, use the official FlakeHub publishing wizard to verify the repository name, set `visibility` to `public`, and verify the trusted GitHub organization binding; run `nix flake check --all-systems --no-build` and confirm the workflow triggers only from protected `main`. After those checks and action pinning, rename `flakehub-publish-rolling.yml.disabled` to `flakehub-publish-rolling.yml`; otherwise delete the disabled file.
- Run `nix flake update` whenever a package or Nix input is upgraded.
- Update `moon.mod` whenever module metadata, dependencies, or target support changes.
- Run `moon check README.mbt.md`, `moon test README.mbt.md`, `moon check`, `moon test`, `moon package --list`, and `nix flake check --all-systems --no-build` before handoff.

_This AGENTS.md was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [AGENTS template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/agents/template.md)._
