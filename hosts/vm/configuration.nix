{
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  networking.hostname = "jasi-vm";
}
