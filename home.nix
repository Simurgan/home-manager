{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/locale.nix
    ./modules/packages.nix
    ./modules/xdg.nix
    ./modules/session.nix
    ./modules/mime.nix
    ./modules/services.nix
    ./modules/theme.nix
  ];

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
