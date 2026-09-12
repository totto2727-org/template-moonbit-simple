# template-moonbit-simple initialization

## Template files

| File | Meaning |
| --- | --- |
| `README.md` | Template entry point asking an AI agent to follow this guide. Relative symlink to `README.mbt.md`. |
| `README.mbt.md` | Physical README content, replaced with the customized project README after initialization. |
| `AGENTS.md` | Template file map and initialization instructions. Replaced after initialization. |
| `README_TEMPLATE.mbt.md` | End-user README skeleton to customize and promote to `README.mbt.md`. |
| `AGENTS_TEMPLATE.md` | Copied-project development guidance to customize and promote to `AGENTS.md`. |
| `src/main.mbt` | Starter source to replace with the new project's behavior. |
| `src/moon.pkg` | Executable package configuration. |
| `moon.mod` | Module identity, version, repository URL, license, keywords, description, and source directory. |
| `flake.nix` | Nix development environment, package outputs, and reusable overlay. |
| `flake.lock` | Pinned Nix inputs. |
| `package.nix` | Nix package definition using the module metadata. |
| `.envrc` | Optional direnv entry point for the Nix shell. |
| `.github/workflows/ci.yml` | Source validation using shared MoonBit actions. |
| `.github/workflows/publish.yml.disabled` | Disabled Mooncakes publication workflow. |
| `.github/workflows/flakehub-publish-rolling.yml.disabled` | Disabled public rolling FlakeHub publication workflow. |
| `.gitignore` | Local outputs excluded from Git. |
| `LICENSE` | License and copyright holder to review for the new project. |

## Initialization

### 1. Establish the project

Use the requested repository name, module name, purpose, license, and publication targets.
Resolve missing project-specific decisions with the user rather than inventing registry ownership or publishing credentials.
Work from the copied repository root and enter `nix develop` before running MoonBit commands.
If using direnv, review `.envrc` before explicitly running `direnv allow`.
Read `mbt-coding` before editing MoonBit production code, `mbt-test` before editing MoonBit tests, and `docs-moonbit` when language-reference guidance is needed.

### 2. Replace metadata and starter files

Replace `username/project`, the repository URL, version, description, keywords, and license in `moon.mod`.
Keep its `readme = "README.mbt.md"` setting.
Replace `project` package and overlay names and the description in `flake.nix`, then update command names and repository references in the project documentation.
Review the license holder and replace the starter source with the actual project.
Retain `package.nix` and the package/overlay outputs for a distributable CLI so the documented Nix installation paths remain valid.
Remove them only if the copied project is no longer distributed as a CLI, and remove unsupported documentation paths at the same time.
Keep shared `totto2727-org/monorepo` action references on `@main`, matching the other simple templates.
Do not create `CLAUDE.md`.

### 3. Create the project's documentation

Customize `README_TEMPLATE.mbt.md` for the actual end-user features, usage, prerequisites, installation methods, and public API.
Customize `AGENTS_TEMPLATE.md` for the actual file layout, development commands, boundaries, and project-specific rules.
Keep these copied-project documents distinct from this template's initialization guidance.
For a CLI, document supported direct `moonx`/`nix run`, installed `moon install`/`nix profile install`, and declarative overlay-based `flake.nix` setup as alternatives, stating that only one setup method is required.
Prefer `moonx username/project` without runner options, replacing the module placeholder with the actual name.
Remove unused placeholders, unsupported setup methods, and template initialization instructions.

Configure or delete each optional publishing workflow using the instructions below before replacing this guide.
Then replace the template-only physical documents with the customized project documents:

```bash
rm README.mbt.md AGENTS.md
mv README_TEMPLATE.mbt.md README.mbt.md
mv AGENTS_TEMPLATE.md AGENTS.md
```

Keep `README.md -> README.mbt.md` as a relative symlink throughout initialization.
Never delete or replace it with a separately authored README.

### 4. Validate and hand off

Within `nix develop`, run `moon check`, `moon test`, and `moon package --list` to validate the initialized source and review the published file list.
Run `moon info` if initialization changes the public API.
Validate any executable MoonBit README examples against the final `README.mbt.md`, not an unrelated fixture or a check reporting no work.
Nix package builds are not required initialization validation.
Run `nix flake update` when packages or Nix inputs are upgraded.
Review the final documents for remaining placeholders, obsolete template references, and broken links, confirm the relative README symlink, then commit the initialized project.

## Publication setup

Mooncakes and FlakeHub publication are independent choices.
Keep both workflows disabled until the copied project explicitly requests publication and completes the applicable setup.
Delete each disabled workflow that is not needed.
Keep shared `totto2727-org/monorepo` actions on `@main` and review their current implementation before enabling publication.
Pin third-party actions to audited full commit SHAs in each publishing workflow before enabling it.

### Mooncakes

1. Set the actual module owner/name, version, repository URL, and publication metadata in `moon.mod`.
2. Have the package owner register or log in to Mooncakes with `moon register` or `moon login`, confirming ownership of the intended module namespace.
3. Store the base64-encoded contents of `~/.moon/credentials.json` in the copied repository's `MOONCAKES_TOKEN` Actions secret, as required by the shared publishing action. Do not commit credentials or print their contents in logs.
4. Run `moon publish --dry-run` in the pinned environment with protected credentials and review the exact package contents before enabling publication.
5. Protect `main`, review action references as described above, then rename `.github/workflows/publish.yml.disabled` to `publish.yml` only when ready. The workflow publishes pushes to `main`, so each new release needs the intended module version committed first.

References: [MoonBit package publishing](https://docs.moonbitlang.com/en/latest/toolchain/moon/package-manage-tour.html) and the [shared Mooncakes publishing action](https://github.com/totto2727-org/monorepo/blob/main/.github/actions/publish-moonbit/action.yaml).

### FlakeHub rolling publication

1. Use the [official FlakeHub publishing wizard](https://flakehub.com/new) to verify the repository name, public visibility, and trusted GitHub organization binding.
2. Review the shared publishing action and third-party pins, and protect `main` before enabling publication.
3. Rename `.github/workflows/flakehub-publish-rolling.yml.disabled` to `flakehub-publish-rolling.yml` only if public rolling publication is wanted. The workflow publishes pushes to `main` with job-scoped OIDC permissions.
