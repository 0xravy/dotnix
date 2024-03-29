{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    hyprland-protocols
    hyprpicker
    hyprpaper
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-wlr];
    config.common.default = "*";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      exec-once = [
        "swaybg -i wall/NixOS_1.0.png"
        "waybar"
      ];

      monitor = [
        "DP-1, 1920x1080, 0x0, 1"
        "HDMI-A-1, 1600x900, 1920x0, 1"
      ];

      env = "XCURSOR_SIZE,24";

      input = {
        kb_layout = "us, ara";
        kb_options = "grp:rctrl_rshift_toggle, caps:escape";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = "no";
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.;
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 4;
        bezier = "linear, 0.0, 0.0, 1.0, 1.0";
        "col.active_border" = "rgb(928374) 270deg";
        "col.inactive_border" = "rgb(282828)";

        layout = "dwindle";

        allow_tearing = false;
      };

      windowrulev2 = "noborder, onworkspace:1";

      decoration = {
        rounding = 0;

        blur = {
          enabled = false;
          size = 3;
          passes = 1;
        };

        drop_shadow = "no";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          #"borderangle, 1, 100, linear, loop"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below;
        preserve_split = "yes"; # you probably want this;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        force_default_wallpaper = -1; # Set to 0 to disable the anime mascot wallpapers;
      };

      # "device:epic-mouse-v1" = {
      #   sensitivity = "-0.5";
      # };

      "$mainMod" = "SUPER";

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bind = [
        "$mainMod, Return, exec, alacritty"
        "$mainMod, Q, killactive,"
        "$mainMod, E, exec, thunar"
        "$mainMod, V, togglefloating,"
        "$mainMod, Space, exec, rofi -show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, I, togglesplit, # dwindle"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        "$mainMod SHIFT, Escape, exit"
        "$mainMod SHIFT, H, resizeactive, -100 0"
        "$mainMod SHIFT, L, resizeactive, 100 0"
        "$mainMod SHIFT, K, resizeactive, 0 -100"
        "$mainMod SHIFT, J, resizeactive, 0 100"
        "$mainMod ALT, H, moveactive, 500 0"
        "$mainMod ALT, L, moveactive, -500 0"
        "$mainMod ALT, K, moveactive, 0 -500"
        "$mainMod ALT, J, moveactive, 0 500"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        ", Print, exec, grim -g \"$(slurp -d)\" - | swappy -f -"
      ];
    };
  };
}
