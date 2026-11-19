{
  pkgs,
  lib,
  moonNix,
  toolchain,
  moonRegistryIndex,
}:
let
  builders = moonNix.lib.mkMoonNix { inherit pkgs toolchain; };
  project = builders.parseManifest "module" (builtins.readFile ./moon.mod);
  pname = lib.last (lib.splitString "/" project.name);
  # moon-nix 026f5a4 predates the format-stable pkgtype declaration. Remove
  # this adapter and call builders.buildProject when upstream recognizes it.
  upstreamManifest = import "${moonNix}/lib/pure/manifest.nix" { inherit lib; };
  manifest = upstreamManifest // {
    read =
      kind: root:
      let
        raw = upstreamManifest.read kind root;
      in
      raw
      // lib.optionalAttrs (kind == "package" && (raw.pkgtype.kind or null) == "executable") {
        is-main = true;
      };
  };
  buildProject = import "${moonNix}/lib/pure/buildProject.nix" {
    inherit
      pkgs
      toolchain
      manifest
      builders
      ;
    resolver = import "${moonNix}/lib/pure/resolve.nix" { inherit lib manifest; };
  };
in
(buildProject {
  src = ./.;
  mainPackage = project.name;
  target = "native";
  name = pname;
  registry = toString moonRegistryIndex;
}).overrideAttrs
  (_: {
    inherit pname;
    version = project.version;
    meta = {
      description = project.description;
      homepage = project.repository;
      license = lib.meta.getLicenseFromSpdxId project.license;
      mainProgram = pname;
    };
  })
