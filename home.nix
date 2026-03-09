{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default

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

  programs.ags = {
    enable = true;

    # Important: keep your real AGS source directly in ~/.config/ags
    # because you want chezmoi to own it.
    configDir = null;

    extraPackages =
      let
        ap = inputs.astal.packages.${pkgs.system};
      in [
        ap.hyprland
        ap.mpris
        ap.network
        ap.bluetooth
        ap.battery
        ap.notifd
        ap.wireplumber
        ap.tray
	ap.powerprofiles

        pkgs.brightnessctl
        pkgs.playerctl
      ];
  };
}
