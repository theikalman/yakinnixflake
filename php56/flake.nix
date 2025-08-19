{
  description = "PHP 5.6 flake";

  inputs = {
    # Pin to a nixpkgs commit from around 2019 where PHP 5.6 existed
    nixpkgs = {
      url = "github:NixOS/nixpkgs/2ee2f9dc0e3ce2066b1c1b6d0da7a58c3d5a8b03";
    };
  };

  outputs = { self, nixpkgs }:
    let
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
