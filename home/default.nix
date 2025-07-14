{ ... }:

{
  home = {
    username = "jasi";
    homeDirectory = "/home/jasi";

    # Release notes: https://nix-community.github.io/home-manager/release-notes.xhtml
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  imports = [
    ./fonts.nix
    ./packages.nix
    ./programs/bat.nix
    ./programs/eza.nix
    ./programs/git.nix
    ./programs/hyprland
    ./programs/kitty.nix
    ./programs/nixvim
    ./programs/shell.nix
    ./programs/starship.nix
  ];
}
