{
  description = "PHP 5.6 flake";

  inputs = {
    # Use official release tarball instead of GitHub
    nixpkgs = {
      url = "https://releases.nixos.org/nixos/18.09/nixos-18.09.2574.4743347b179/nixexprs.tar.xz";
      flake = false;
    };
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.php56 = pkgs.php56;

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.php56
        pkgs.php56Packages.composer
      ];
    };
  };
}
