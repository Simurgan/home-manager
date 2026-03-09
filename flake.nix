{
  description = "Simurgan's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal.url = "github:Aylur/astal";
    ags.url = "github:Aylur/ags";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ags, astal, ... }:
    let
      mkHome = { system, username, homeDirectory, extraModules ? [ ] }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = false;
          };

          extraSpecialArgs = { inherit inputs; };

          modules = [
            ./home.nix
            {
              home.username = username;
              home.homeDirectory = homeDirectory;
            }
          ] ++ extraModules;
        };
    in {
      homeConfigurations = {
        simurgan-linux = mkHome {
          system = "x86_64-linux";
          username = "simurgan";
          homeDirectory = "/home/simurgan";
          extraModules = [
            ./platforms/linux.nix
          ];
        };

        # later examples:
        # simurgan-linux-arm = mkHome {
        #   system = "aarch64-linux";
        #   username = "simurgan";
        #   homeDirectory = "/home/simurgan";
        #   extraModules = [ ./platforms/linux.nix ];
        # };

        # simurgan-darwin = mkHome {
        #   system = "aarch64-darwin";
        #   username = "simurgan";
        #   homeDirectory = "/Users/simurgan";
        #   extraModules = [ ./platforms/darwin.nix ];
        # };
      };
    };
}
