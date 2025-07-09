{
  imports = [
    ./hardware-configuration.nix
    ../shared
  ];

  networking.hostName = "vm";
}
