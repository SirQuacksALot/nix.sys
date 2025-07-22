{ config, pkgs, username, ... }: 
{
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ zsh nano ];
    shell = pkgs.zsh;
  };
  
  programs.zsh.enable = true;
}
