{
  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      # name = "GeistMono Nerd Font Mono";
      size = 18;
    };
    keybindings = {
      "kitty_mod+h" = "previous_tab";
      "kitty_mod+j" = "next_window";
      "kitty_mod+k" = "previous_window";
      "kitty_mod+l" = "next_tab";
      "kitty_mod+p" = "next_layout";
    };
    settings = {
      kitty_mod = "shift+cmd";
      enabled_layouts = "horizontal,vertical";

      window_padding_width = 15;
      disable_ligatures = "always";

      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      hide_window_decorations = "titlebar-only";

      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
      cursor_trail = 1;
      cursor_trail_decay = "0.01 0.09";
    };
    extraConfig = "include current-theme.conf";
  };
}
