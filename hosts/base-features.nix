{ config, pkgs, ... }:
let
  # -------------[ Overal Settings ]-------------------
  locale      = "de_DE.UTF-8";
  key_layout  = "de";
  key_variant = "";
in
{
  # ---------------[ Experimental ]--------------------
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # -------------[ Location settings ]-----------------
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASURMENT     = locale;
    LC_MONETARY       = locale;
    LC_NAME           = locale;
    LC_NUMERIC        = locale;
    LC_PAPER          = locale;
    LC_TELEPHONE      = locale;
    LC_TIME           = locale;
  };

  services.xerver.xkb = {
    layout  = key_layout;
    variant = key_variant;
  };

  console.keyMap = kay_layout;


  # ---------------[ Basic Packaes ]------------------
  environment.systemPackages = with pkgs; [ 
    git 
    nano 
  ];

}
