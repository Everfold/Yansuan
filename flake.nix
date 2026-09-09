{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:nix-community/flakelight";
  };
  outputs =
    { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;
      devShell =
        pkgs:
        let
          llvmPkgs = pkgs.llvmPackages_latest;
        in
        {
          stdenv = llvmPkgs.stdenv;

          packages =
            (with pkgs; [
              coreutils
              pre-commit
              xmake
            ])
            ++ (with llvmPkgs; [
              llvm
              clang-tools
              lldb
            ]);
        };
    };
}
