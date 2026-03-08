{ ... }:

{
  xdg.desktopEntries.yazi = {
    name = "Yazi";
    genericName = "Terminal File Manager";
    comment = "Open directories in Yazi";
    exec = "alacritty -e yazi %F";
    terminal = false;
    categories = [ "System" "FileManager" "Utility" ];
    mimeType = [ "inode/directory" ];
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = [ "librewolf.desktop" ];
      "x-scheme-handler/http" = [ "librewolf.desktop" ];
      "x-scheme-handler/https" = [ "librewolf.desktop" ];
      "x-scheme-handler/about" = [ "librewolf.desktop" ];
      "x-scheme-handler/unknown" = [ "librewolf.desktop" ];

      "application/pdf" = [ "librewolf.desktop" ];
      "inode/directory" = [ "yazi.desktop" ];
      "x-scheme-handler/mailto" = [ "librewolf.desktop" ];
    };
  };
}
