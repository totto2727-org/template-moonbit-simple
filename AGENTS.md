# template-moonbit-simple

## Repository structure

```text
.github/workflows/          Validation and optional publishing workflows
AGENTS_TEMPLATE.md          AI and developer guidance for copied projects
README.mbt.md               Relative symbolic link to src/README.mbt.md
README.md                   Relative symbolic link to README.mbt.md
README_TEMPLATE.mbt.md      Relative symbolic link to src/README_TEMPLATE.mbt.md
flake.nix                   Reproducible MoonBit development environment
moon.mod                    Template module metadata and target policy
src/lib.mbt                 Sample public library implementation
src/lib_test.mbt            Sample unit test
src/moon.pkg                Root package configuration
src/README.mbt.md           Canonical template documentation and checked examples
src/README_TEMPLATE.mbt.md  Canonical end-user documentation for copied projects
```

## Development commands

### Execution rules

- Run commands from the repository root.
- Enter the environment with `nix develop` before running MoonBit commands.
- Read the `mbt-coding` skill before editing MoonBit production code, the `mbt-test` skill before editing MoonBit tests, and `docs-moonbit` when language-reference guidance is needed.
- Keep `README.md -> README.mbt.md -> src/README.mbt.md` as relative symbolic links; never replace them with independently authored files.
- Keep `README_TEMPLATE.mbt.md` as a relative symbolic link to `src/README_TEMPLATE.mbt.md`.
- Keep `README_TEMPLATE.mbt.md` and `AGENTS_TEMPLATE.md` ready to become the copied project's canonical documents.

### Standard tasks

- `nix develop` — Enter the pinned MoonBit development environment.
- `moon info` — Regenerate package interface information after public API changes.
- `moon check` — Type-check all packages.
- `moon test` — Run all package and documentation tests discovered under the configured source root.
- `moon check README.mbt.md` — Type-check the canonical README examples through its package-local target.
- `moon test README.mbt.md` — Run the canonical README tests through its package-local target.
- `moon package --list` — Confirm the packages that will be published.

## Architecture

### Template documentation

- `README.mbt.md` and this `AGENTS.md` describe how to use and maintain the template repository.
- `README_TEMPLATE.mbt.md` and `AGENTS_TEMPLATE.md` become the copied project's documentation after their placeholders are replaced.
- All four documents follow the share-artifact README or AGENTS specification and retain their provenance footers.

### Library sample

- `src/lib.mbt` demonstrates one documented public function without imposing an application architecture on copied repositories.
- `src/lib_test.mbt` demonstrates an externally observable test and can be replaced with project-specific tests.

### Target policy

- Synchronous, backend-neutral libraries leave both `supported_targets` and `preferred_target` unset.
- Async libraries enable `supported_targets` and select the first viable preferred target in this order: `wasm`, `js`, then `native`.
- Dependency target support can narrow the enabled targets; a JavaScript preferred target also requires `pkgs.nodejs` in `flake.nix`.

### Automation

- The CI workflow checks the default or configured preferred MoonBit target.
- Mooncakes and FlakeHub publishing workflows remain disabled until a copied project explicitly enables them.

## Development tools

- **MoonBit**: Checks, tests, documents, and packages the sample library.
- **Nix flakes**: Pin the MoonBit toolchain and optional target dependencies.
- **GitHub Actions**: Validate the repository and optionally publish releases.

## Package-specific rules

- Replace `username/project`, the repository URL, description, and keywords in `moon.mod` when converting a copied repository.
- Customize `src/README_TEMPLATE.mbt.md` and `AGENTS_TEMPLATE.md`, apply the registry-first API documentation rule, then replace the template-only canonical files while preserving the `README.md` symbolic link:

```bash
rm README.mbt.md README_TEMPLATE.mbt.md AGENTS.md src/README.mbt.md
mv src/README_TEMPLATE.mbt.md src/README.mbt.md
ln -s src/README.mbt.md README.mbt.md
mv AGENTS_TEMPLATE.md AGENTS.md
```

- Keep publishing workflows disabled until every mutable `uses:` reference in each privileged publishing workflow is pinned to an audited full commit SHA.
- Store the base64-encoded Mooncakes credentials file in `MOONCAKES_TOKEN`. After pinning action references, validate with `moon publish --dry-run` in a protected environment, then enable publication by renaming `publish.yml.disabled` to `publish.yml`; otherwise delete the disabled file.
- Before enabling FlakeHub publication, use the official FlakeHub publishing wizard to verify the repository name, set `visibility` to `public`, and verify the trusted GitHub organization binding; run `nix flake check --all-systems --no-build` and confirm the workflow triggers only from protected `main`. After those checks and action pinning, rename `flakehub-publish-rolling.yml.disabled` to `flakehub-publish-rolling.yml`; otherwise delete the disabled file.
- Run `nix flake update` whenever a package or Nix input is upgraded.
- Run `moon check README.mbt.md`, `moon test README.mbt.md`, `moon check`, `moon test`, `moon package --list`, and `nix flake check --all-systems --no-build` in the converted repository before handoff.

_This AGENTS.md was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [AGENTS template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/agents/template.md)._
