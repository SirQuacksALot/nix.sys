{ pkgs, username, ... }: 

{
  programs.zsh.enable = true;
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  # users.users.${username}.shell = pkgs.zsh;


  home.stateVersion = "25.05";
}
