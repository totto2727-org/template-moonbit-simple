# username/project

A simple MoonBit library project.

## Start a project

1. Create a repository with GitHub's **Use this template** button.
2. Replace `username/project` and the repository URL in `moon.mod`.
3. Update the module description, keywords, and `README.mbt.md`. `README.md` is a relative symbolic link to `README.mbt.md`, so edit only `README.mbt.md`.
4. To publish the module to Mooncakes, add `MOONCAKES_TOKEN` as a repository secret and rename `.github/workflows/publish.yml.disabled` to `publish.yml`. Delete the disabled file if Mooncakes publishing is not needed.
5. To publish the Nix flake to FlakeHub, rename `.github/workflows/flakehub-publish-rolling.yml.disabled` to `flakehub-publish-rolling.yml`. Delete the disabled file if FlakeHub publishing is not needed.

## Target policy

Leave `supported_targets` and `preferred_target` unset for synchronous, backend-neutral libraries.

For libraries with async APIs, uncomment `supported_targets = "+native+js+wasm"` in `moon.mod` and select exactly one commented `preferred_target` in this order: `wasm`, `js`, then `native`. If a dependency supports fewer targets, narrow both settings to the dependency's supported targets.

When selecting `js`, also uncomment `pkgs.nodejs` in `flake.nix`.

## Usage

```mbt check
///|
test {
  inspect(@project.add(2, 3), content="5")
}
```

## Development

Enter the Nix development shell and run the standard MoonBit checks:

```bash
nix develop
moon info
moon check
moon test
moon package --list
```
