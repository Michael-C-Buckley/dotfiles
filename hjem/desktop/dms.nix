let
  path = ../../configs/desktop;
in {
  hjem.users.michael.xdg.config.files = {
    "DankMaterialShell/settings.json" = {
      source = "${path}/dms-settings.json";
      type = "copy";
    };
  };
}
