{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  programs.bat.enable = true;
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    extraOptions = [ "--group-directories-first" ];
  };

  home.packages = with pkgs; [
    gnupg

    # cli
    fd # find
    gnused
    (writeShellScriptBin "gsed" "exec ${gnused}/bin/sed \"$@\"")
    ripgrep
    wget
    xz
    dust # du

    nerd-fonts.fira-code
    nerd-fonts.agave
    nerd-fonts.monaspace
    nerd-fonts.caskaydia-cove
    nerd-fonts.geist-mono

    # javascript
    nodejs_22
    pnpm
    nodePackages.yarn
    bun

    rustup
    sqlx-cli

    # formatters
    stylua
    nixfmt-rfc-style
    prettierd
  ];
}
