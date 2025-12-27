{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      dms,
      ...
    }:
    {
      
      nixosModules.default =
        {
          config,
          pkgs,
          lib,
          ...
        }:
        {

          imports = [
            dms.nixosModules.dankMaterialShell
          ];

          programs.dankMaterialShell = {
            enable = true;
            #
            systemd.enable = true;
            enableSystemMonitoring = true;
            enableVPN = true;
            enableDynamicTheming = true;
            enableAudioWavelength = true;
            enableCalendarEvents = true;
          };

          # Hyprland Wayland compositor
          programs.hyprland = {
            enable = true;
            withUWSM = true; # unified wayland session manager (recommended)
            xwayland.enable = true; # keep in sync with your preference
          };


          # Useful Wayland tools and companions
          environment.systemPackages = with pkgs; [
          ];

          # Create desktop session entry for dms-hyprland
          services.displayManager.sessionPackages = [
            (pkgs.writeTextFile {
              name = "session_type_b.desktop";
              destination = "/share/wayland-sessions/session_type_b.desktop";
              text = ''
                [Desktop Entry]
                Name=Session Type B
                Comment=Session Type B with Dank Material Shell and Hyprland
                Exec=Hyprland --config /etc/hypr/hyprland_session_type_b.conf
                Type=Application
                DesktopNames=Hyprland
              '';
              passthru.providedSessions = [ "session_type_b" ];
            })
          ];

        };
    };
}
