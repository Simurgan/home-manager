{ config, ... }:

{
  xdg.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = null;
    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/downloads";
    pictures = "${config.home.homeDirectory}/pictures";
    videos = "${config.home.homeDirectory}/videos";

    extraConfig = {
      XDG_WORKSPACE_DIR = "${config.home.homeDirectory}/src";
    };
  };
}
