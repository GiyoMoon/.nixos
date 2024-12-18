{
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  networking.hostName = "vm";
}
