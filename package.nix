{
  pkgs,
  moonNix,
  toolchain,
  moonRegistryIndex,
}:
(moonNix.lib.mkMoonNix { inherit pkgs toolchain; }).buildProject {
  src = ./.;
  registry = moonRegistryIndex.outPath;
}
