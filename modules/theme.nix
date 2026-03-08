{ pkgs, ... }:

let
  ayuGraphiteGtk = pkgs.stdenvNoCC.mkDerivation {
    pname = "graphite-ayu-dark";
    version = "1.0";
    src = ../themes/Graphite-Ayu-Dark;

    installPhase = ''
      mkdir -p $out/share/themes
      cp -r . $out/share/themes/Graphite-Ayu-Dark
    '';
  };
in
{
  gtk = {
    enable = true;

    theme = {
      package = ayuGraphiteGtk;
      name = "Graphite-Ayu-Dark";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.kdePackages.breeze;
    name = "breeze_cursors";
    size = 28;
  };
}
