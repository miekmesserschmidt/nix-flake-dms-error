{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    greeter.url = "path:../../common/greeter";

    session_type_a.url = "path:../../common/session_type_a";
    session_type_b.url = "path:../../common/session_type_b";

    home-manager.url = "github:nix-community/home-manager";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      greeter,
      session_type_a,
      session_type_b,
      ...
    }@attrs:
    {
      nixosConfigurations.hosta = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          #########################
          greeter.nixosModules.default
          {
            programs.dankMaterialShell.greeter.configHome = "/home/usera";
          }

          session_type_a.nixosModules.default
          session_type_b.nixosModules.default

          ./configuration.nix

          # Home Manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.usera = import ../../common_users/usera/home.nix;
            home-manager.extraSpecialArgs = { };
          }

          # Allow unfree packages
          {
            nixpkgs.config.allowUnfree = true;
          }
        ];
      };
    };
}
