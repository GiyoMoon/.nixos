{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "PATH,$HOME/.nix-profile/bin,/nix/var/nix/profiles/default/bin,$HOME/.cargo/bin"
      ];
      monitor = [ ",2560x1440@144,auto,1" ];
      "$mod" = "SUPER";
      bind = [
        "$mod, T, exec, kitty"
        "$mod, F, exec, firefox"
        "$mod, R, exec, fuzzel"
      ];
    };
  };
}
