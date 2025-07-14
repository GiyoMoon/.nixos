{ pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_US.UTF-8";

  users = {
    users.jasi = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.fish;
    };
  };

  networking = {
    networkmanager.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    gvfs.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "catppuccin-mocha";
    };
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
    sessionVariables = rec {
      # TERMINAL = "kitty";
      EDITOR = "nvim";
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [
        "${XDG_BIN_HOME}"
      ];
      # Electron apps, please use wayland
      NIXOS_OZONE_WL = "1";
    };
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

  system.stateVersion = "24.11";

  programs.fish.enable = true;
  programs.xwayland.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
