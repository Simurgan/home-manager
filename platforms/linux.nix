{ pkgs, ... }:

{
  # Linux-specific session defaults can live here if needed later.
  # Keep this small for now.

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
  };
}
