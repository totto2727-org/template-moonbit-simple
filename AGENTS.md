# template-moonbit-simple

This file describes how AI agents maintain this template and convert a repository created from it into a project repository.

## Documentation Roles

- `README.mbt.md` and this `AGENTS.md` explain the template itself and must not remain as the copied project's documentation.
- `README_TEMPLATE.mbt.md` and `AGENTS_TEMPLATE.md` are the starting points for the copied project's documentation.
- `README.md` is a relative symbolic link to `README.mbt.md`; never edit or replace the link directly.

## Converting a Template Copy

After creating a repository with GitHub's **Use this template** button, complete every step below:

1. Replace `project`, `username/project`, and the repository URL in `moon.mod` and `flake.nix`.
2. Update the module description, keywords, and version.
3. If the copied project does not need a Nix package or overlay, delete `package.nix` and remove the `packages`, `overlays`, and related package wiring from `flake.nix`, leaving the development shell in place.
4. To publish the module to Mooncakes, add `MOONCAKES_TOKEN` as a repository secret and rename `.github/workflows/publish.yml.disabled` to `publish.yml`. Delete the disabled file if Mooncakes publishing is not needed.
5. To publish the Nix flake to FlakeHub, rename `.github/workflows/flakehub-publish-rolling.yml.disabled` to `flakehub-publish-rolling.yml`. Delete the disabled file if FlakeHub publishing is not needed.
6. Replace the placeholders in `README_TEMPLATE.mbt.md` with the copied project's user-facing overview, usage, features, prerequisites, setup, and license details.
7. Replace the placeholders in `AGENTS_TEMPLATE.md` with the copied project's commands, architecture, and conventions while preserving its required MoonBit skill and package-update rules.
8. Remove the template-only `README.mbt.md` and `AGENTS.md`, then promote the completed template files without changing the `README.md` symbolic link:

```bash
rm README.mbt.md AGENTS.md
mv README_TEMPLATE.mbt.md README.mbt.md
mv AGENTS_TEMPLATE.md AGENTS.md
```

## Template Development Commands

Enter the Nix development shell and run the standard MoonBit checks when modifying the template implementation:

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
