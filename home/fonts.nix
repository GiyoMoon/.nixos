{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.agave
    nerd-fonts.monaspace
    nerd-fonts.caskaydia-cove
    nerd-fonts.geist-mono
  ];
}
