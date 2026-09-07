{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:nix-community/flakelight";
    cl-nix-lite.url = "github:hraban/cl-nix-lite/v0";
  };

  outputs =
    { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;

      withOverlays = [ inputs.cl-nix-lite.overlays.default ];

      devShell =
        pkgs:
        with pkgs.lispPackagesLite;
        lispDerivation {
          name = "sunmao";
          src = pkgs.lib.cleanSource ./.;
          lispSystem = "dev";
          lispDependencies = [ ];
          dontBuild = true;
          nativeBuildInputs = with pkgs; [
            pkg-config
            pre-commit
          ];
        };
    };
}
