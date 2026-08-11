# username/project

A simple MoonBit library project.

## Start a project

1. Create a repository with GitHub's **Use this template** button.
2. Replace `username/project` and the repository URL in `moon.mod`.
3. Update the module description, keywords, and `README.mbt.md`. `README.md` is a relative symbolic link to `README.mbt.md`, so edit only `README.mbt.md`.
4. To publish the module to Mooncakes, add `MOONCAKES_TOKEN` as a repository secret and rename `.github/workflows/publish.yml.disabled` to `publish.yml`. Delete the disabled file if Mooncakes publishing is not needed.
5. To publish the Nix flake to FlakeHub, replace `username/project` in `.github/workflows/flakehub-publish-rolling.yml.disabled` and rename the file to `flakehub-publish-rolling.yml`. Delete the disabled file if FlakeHub publishing is not needed.

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
```
