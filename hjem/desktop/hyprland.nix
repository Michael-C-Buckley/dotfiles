let
  path = ../../configs/desktop/hyprland;
in {
  hjem.users.michael = {
    xdg.config.files = {
      "hypr/binds.lua".source = "${path}/binds.lua";
      "hypr/hyprland.lua".source = "${path}/hyprland.lua";
      "hypr/input.lua".source = "${path}/input.lua";
      "hypr/lookfeel.lua".source = "${path}/lookfeel.lua";
      "hypr/dms.lua".source = "${path}/dms.lua";
    };
  };
}
