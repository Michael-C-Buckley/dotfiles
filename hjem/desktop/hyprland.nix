let
  path = ../../configs/desktop/hyprland;
in {
  hjem.users.michael = {
    xdg.config.files = {
      "hypr/binds.lua" = {
        source = "${path}/binds.lua";
        clobber = false;
      };
      "hypr/hyprland.lua" = {
        source = "${path}/hyprland.lua";
        clobber = false;
      };
      "hypr/input.lua" = {
        source = "${path}/input.lua";
        clobber = false;
      };
      "hypr/lookfeel.lua" = {
        source = "${path}/lookfeel.lua";
        clobber = false;
      };
      "hypr/dms.lua" = {
        source = "${path}/dms.lua";
        clobber = false;
      };
    };
  };
}
