{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "LIBGL_ALWAYS_SOFTWARE=1"
        "WLR_RENDERER_ALLOW_SOFTWARE=1"
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
