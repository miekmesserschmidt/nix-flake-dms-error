This flake-based setup does not work. why?

```
❯ nix flake check
error:
       … while checking flake output 'nixosConfigurations'
         at /nix/store/i2h3h2jdvwzhi3psq0nycqf52xrrq02r-source/flake.nix:30:7:
           29|     {
           30|       nixosConfigurations.hosta = hosta.nixosConfigurations.hosta;
             |       ^
           31|       nixosConfigurations.hostb = hostb.nixosConfigurations.hostb;

       … while checking the NixOS configuration 'nixosConfigurations.hosta'
         at /nix/store/i2h3h2jdvwzhi3psq0nycqf52xrrq02r-source/flake.nix:30:7:
           29|     {
           30|       nixosConfigurations.hosta = hosta.nixosConfigurations.hosta;
             |       ^
           31|       nixosConfigurations.hostb = hostb.nixosConfigurations.hostb;

       … while evaluating the option `system.build.toplevel':

       … while evaluating definitions from `/nix/store/0lc6kbmhkqk8vmgflpn2n1d1qb3vl2f5-source/nixos/modules/system/activation/top-level.nix':

       … while evaluating the option `assertions':

       … while evaluating definitions from `/nix/store/0lc6kbmhkqk8vmgflpn2n1d1qb3vl2f5-source/nixos/modules/system/boot/systemd.nix':

       … while evaluating the option `systemd.services':

       … while evaluating definitions from `/nix/store/0lc6kbmhkqk8vmgflpn2n1d1qb3vl2f5-source/nixos/modules/services/logging/logrotate.nix':

       … while evaluating the option `services.logrotate.enable':

       … while evaluating the option `users.groups':

       … while evaluating definitions from `/nix/store/0lc6kbmhkqk8vmgflpn2n1d1qb3vl2f5-source/nixos/modules/config/resolvconf.nix':

       … while evaluating the option `networking.resolvconf.enable':

       … while evaluating the option `environment.etc':

       … while evaluating definitions from `/nix/store/0lc6kbmhkqk8vmgflpn2n1d1qb3vl2f5-source/flake.nix':

       (stack trace truncated; use '--show-trace' to show the full, detailed trace)

       error: The option `programs.dankMaterialShell.enable' in `/nix/store/0lc6kbmhkqk8vmgflpn2n1d1qb3vl2f5-source/flake.nix' is already declared in `/nix/store/0lc6kbmhkqk8vmgflpn2n1d1qb3vl2f5-source/flake.nix'.

    ```