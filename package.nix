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
in
(builders.buildProject {
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
