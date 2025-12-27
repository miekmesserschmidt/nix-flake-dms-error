{ config, pkgs, lib, ... }:

{
  # System configuration for hosta
  networking.hostName = "hosta";
  
  system.stateVersion = "24.05";
}
