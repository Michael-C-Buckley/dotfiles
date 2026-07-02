let
  path = ../../configs/desktop/oxwm;
in {
  hjem.users.michael.xdg.config.files = {
    "oxwm/config.lua" = {
      source = "${path}/config.lua";
      clobber = false;
    };
    "oxwm/binds.lua" = {
      source = "${path}/binds.lua";
      clobber = false;
    };
    "oxwm/bar.lua" = {
      source = "${path}/bar.lua";
      clobber = false;
    };
    "oxwm/colors.lua" = {
      source = "${path}/colors.lua";
      clobber = false;
    };
  };
}
