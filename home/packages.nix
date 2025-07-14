{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnupg
    gnused
    (writeShellScriptBin "gsed" "exec ${gnused}/bin/sed \"$@\"")

    wget
    xz

    fd # better find
    dust # better du
    ripgrep # better grep

    nodejs_22
    pnpm
    nodePackages.yarn
    bun

    rustup
    sqlx-cli
  ];
}
