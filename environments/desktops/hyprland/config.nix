{ config, pkgs, host, username, home-manager, ... }:

{
  imports = [ home-manager.nixosModules.home-manager{
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${username} = ./home/home.nix;
    home-manager.extraSpecialArgs = { inherit host username; };
  }];
}
