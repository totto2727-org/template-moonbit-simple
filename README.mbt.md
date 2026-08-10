# username/project

A simple MoonBit library project.

## Start a project

1. Create a repository with GitHub's **Use this template** button.
2. Replace `username/project` and the repository URL in `moon.mod`.
3. Update the module description, keywords, and this README.
4. Add `MOONCAKES_TOKEN` as a repository secret when the module is ready to publish.

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
