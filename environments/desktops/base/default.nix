{ config, pkgs, ... }:

{
  users.users.sebastian = {
    isNormalUser = true;
    description = "sebastian";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
