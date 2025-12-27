{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hosta = {
      url = "path:./hosts/hosta";
    };

    hostb = {
      url = "path:./hosts/hostb";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      #
      hosta,
      hostb,

      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations.hosta = hosta.nixosConfigurations.hosta;
      nixosConfigurations.hostb = hostb.nixosConfigurations.hostb;

    };
}
