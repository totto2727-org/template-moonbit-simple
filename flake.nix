{
  description = "A simple MoonBit CLI template";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    moonbit-overlay = {
      url = "github:totto2727/moonbit-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, moonbit-overlay, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;
      projectOverlay = final: _previous: {
        project = final.callPackage ./package.nix {
          moonbitToolchain = final.moonbit-bin.moonbit.latest;
        };
      };
      overlay = nixpkgs.lib.composeManyExtensions [
        moonbit-overlay.overlays.default
        projectOverlay
      ];
      mkPkgs = system: import nixpkgs {
        inherit system;
        overlays = [ overlay ];
      };
    in
    {
      overlays.default = overlay;

      packages = forEachSystem (system:
        let
          pkgs = mkPkgs system;
        in
        rec {
          inherit (pkgs) project;
          default = project;
        });

      devShells = forEachSystem (system:
        let
          pkgs = mkPkgs system;
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.moonbit-bin.moonbit.latest
            ];
          };
        });
    };
}
