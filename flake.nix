{
  description = "A simple MoonBit CLI template";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    moonbit-overlay = {
      url = "github:moonbit-community/moonbit-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    moon-nix = {
      url = "github:moonbit-community/moon-nix/026f5a4e9fc7bf78699d69fdb70318c26ac8f07c";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.moonbit-overlay.follows = "moonbit-overlay";
    };
    moon-registry = {
      url = "git+https://mooncakes.io/git/index";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      moonbit-overlay,
      moon-nix,
      moon-registry,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;
      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          overlays = [ moonbit-overlay.overlays.default ];
        };
      toolchainFor = pkgs: pkgs.moonbit-bin.latest;
      mkProject =
        pkgs:
        pkgs.callPackage ./package.nix {
          moonNix = moon-nix;
          toolchain = toolchainFor pkgs;
          moonRegistryIndex = moon-registry;
        };
    in
    {
      overlays.default = _final: previous: {
        project = self.packages.${previous.stdenv.hostPlatform.system}.project;
      };

      packages = forEachSystem (
        system:
        let
          project = mkProject (mkPkgs system);
        in
        {
          inherit project;
          default = project;
        }
      );

      devShells = forEachSystem (
        system:
        let
          pkgs = mkPkgs system;
        in
        rec {
          ci = default.overrideAttrs (_: {
            shellHook = "";
          });
          default = pkgs.mkShell {
            packages = [
              (toolchainFor pkgs)
            ];
            shellHook = ''
              # Enable Git Hook
              vp config
            '';
          };
        }
      );
    };
}
