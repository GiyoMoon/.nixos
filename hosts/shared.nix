{ pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.opengl.enable = true;

  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_US.UTF-8";

  users = {
    users.jasi = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
    };
    defaultUserShell = pkgs.fish;
  };
  programs.fish.enable = true;

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.caskaydia-cove
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Product Sans" ];
        monospace = [ "CaskaydiaCove Nerd Font" ];
      };
    };
  };

  environment = {
    shells = with pkgs; [ fish ];
    # environment.systemPackages = with pkgs; [
    # ];
  };

  security.polkit.enable = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      auto-optimise-store = true;
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 5d";
    };
    optimise.automatic = true;
  };

  system.stateVersion = "24.05";
}
