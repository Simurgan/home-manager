{ config ... }:

{
  xdg.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    videos = "${config.home.homeDirectory}/Videos";

    extraConfig = {
      XDG_WORKSPACE_DIR = "${config.home.homeDirectory}/Workspace";
    };
  };
}
