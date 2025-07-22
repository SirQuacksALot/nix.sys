{
  description = "Main System Flake"

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    # --------------[ .Systems ]-------------
    nixosConfiurations.acerAspire5738Z = nixpks.lib.nixosSystem {
      specialArgs = { inherit system; };
      modules = [
        ./hosts/acer_aspire_5738Z/configuration.nix
      ];
    };        

    # ---------------[ Shells ]--------------
    devShells.x86_6-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [ hello ];
      shellHook = ''
        echo "Welcome to the devShell!"
      '';
    };
  };
}
