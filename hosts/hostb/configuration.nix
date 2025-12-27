{ config, pkgs, lib, ... }:

{
  # System configuration for hostb
  networking.hostName = "hostb";
  
  system.stateVersion = "24.05";
}
