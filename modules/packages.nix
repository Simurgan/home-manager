{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    zoxide
    fzf
    ripgrep
    bat

    chezmoi
    alacritty
    tmux
    starship
    neovim
    yazi

    fuzzel
    brightnessctl
    playerctl
  ];
}
