{pkgs, ...}: let
  path = ../../configs/editor/zed;
in {
  hjem.users.michael = {
    packages = [pkgs.zed-editor];
    xdg.config.files."zed/settings.json" = {
      source = "${path}/settings.json";
      type = "copy";
    };
  };
}
