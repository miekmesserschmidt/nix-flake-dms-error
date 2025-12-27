{ config, pkgs, lib, ... }:

{
  home.username = "usera";
  home.homeDirectory = lib.mkForce "/home/usera";
  
  # This value determines the Home Manager release that your
  # configuration is compatible with.
  home.stateVersion = "24.05";
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
