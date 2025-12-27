{ config, pkgs, lib, ... }:

{
  # System configuration for hostb
  networking.hostName = "hostb";
  
  # Filesystem configuration
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  
  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # User configuration
  users.users.usera = {
    isNormalUser = true;
    group = "usera";
  };
  users.groups.usera = {};
  
  system.stateVersion = "24.05";
}
