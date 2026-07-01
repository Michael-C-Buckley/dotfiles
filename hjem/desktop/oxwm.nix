let
  path = ../../configs/desktop/oxwm;
in {
  hjem.users.michael.xdg.config.files = {
    "oxwm/config.lua".source = "${path}/config.lua";
    "oxwm/binds.lua".source = "${path}/binds.lua";
    "oxwm/bar.lua".source = "${path}/bar.lua";
    "oxwm/colors.lua".source = "${path}/colors.lua";
  };
}
