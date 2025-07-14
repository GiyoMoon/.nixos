{
  imports = [
    ./hardware-configuration.nix
    ../shared
  ];

  networking.hostName = "vm";

  services.xserver.videoDrivers = [ "virtio" ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
