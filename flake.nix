{
  description = "Main System Flake";

  # ------------[ System Inputs ]--------------
  inputs.nixpkgs.url 	      = "github:nixos/nixpkgs?ef=nixos-25.05";       # stable version
  inputs.nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";   # roling
  inputs.nixos-hardware.url   = "github:nixos/nixos-hardware/master";        # hardware tweaks (optinal)
  inputs.home-manager.url     = "github:nix-community/home-manager";         # home manager
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  # ------------[ System Outputs ]-------------
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixos-hardware, home-manager, ... }: let
    # --------[ Basic definitions ]------------
    system = "x86_64-linux";
    host = "acer_aspire_5738Z";

    # -----[ Package Manager definition ]------
    pkgs = import nixpkgs { 
      inherit system;
      config.allowUnfree = true;
      config.android_sdk.accept_license = true;
      overlays = [ (final: _: {
	unstable = import nixpkgs-unstable {
	  inherit (final.stenv.hostPlatform) system;
	  inherit (final) config;
          };
	}) ];
    };
  in {
    # ---------------[ System ]---------------- 
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system home-manager; };
      modules = [ ./hosts/${host}/configuration.nix ];
    };        

    # -------------[ Dev Shells ]--------------
    #
    # spaeter in eigenen flake auslagern
    #
    # devShells.x86_6-linux.default = pkgs.mkShell {
    #   buildInputs = with pkgs; [ hello ];
    #   shellHook = ''
    #     echo "Welcome to the devShell!"
    #   '';
    # };
  };
}
