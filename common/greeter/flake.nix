{
  inputs = {

    dms.url = "github:AvengeMedia/DankMaterialShell/stable";

  };

  outputs =
    {
      self,
      dms,
      ...
    }:
    {

      nixosModules.default = {

        imports = [
          dms.nixosModules.greeter
        ];

        programs.dankMaterialShell.greeter = {
          enable = true;
          compositor = {
            name = "hyprland";
            customConfig = ''
              monitor=,preferred,auto,1
            '';
          };

        };

      };
    };
}
