{ ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "librewolf";
    TERMINAL = "alacritty";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    }; 
  };
}
