# MoonBit Simple CLI Template

A GitHub repository template for starting a simple MoonBit command-line application with a Nix development shell, a buildable package and overlay, automated checks, and optional publishing workflows.

## Use This Template

Create a repository with GitHub's **Use this template** button, then follow the conversion workflow in [AGENTS.md](./AGENTS.md). The workflow replaces the template's explanatory documentation with project-specific files based on `README_TEMPLATE.mbt.md` and `AGENTS_TEMPLATE.md`.

## Included Tooling

- A Nix development shell with the MoonBit toolchain.
- A buildable Nix package and reusable overlay.
- GitHub Actions checks for the supported MoonBit targets.
- Optional Mooncakes and FlakeHub publishing workflows, disabled by default.
- A dependency-free Hello World CLI that can be replaced with project code.

## Documentation Layout

- `README.mbt.md` and `AGENTS.md` explain this template and the conversion workflow.
- `README_TEMPLATE.mbt.md` and `AGENTS_TEMPLATE.md` are customized and renamed for the copied project.
- `README.md` is a relative symbolic link to `README.mbt.md` so MoonBit and GitHub use the same user-facing document.

## Development

For template conversion steps, development commands, and publishing configuration, see [AGENTS.md](./AGENTS.md).

## License

[MIT](./LICENSE)
