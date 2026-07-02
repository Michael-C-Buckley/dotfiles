{pkgs, ...}: let
  path = ../../configs/shells/fish;
in {
  hjem.users.michael = {
    packages = [pkgs.fish];
    files.".profile" = {
      source = "${path}/profile";
      clobber = false;
    };
    xdg.config.files = {
      "fish/config.fish" = {
        source = "${path}/config.fish";
        clobber = false;
      };
      "fish/functions" = {
        source = "${path}/functions";
        clobber = false;
      };
    };
  };
}
