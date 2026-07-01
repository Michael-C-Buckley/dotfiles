{pkgs, ...}: let
  path = ../../configs/shells/fish;
in {
  hjem.users.michael = {
    packages = [pkgs.fish];
    files.".profile".source = "${path}/profile";
    xdg.config.files = {
      "fish/config.fish".source = "${path}/config.fish";
      "fish/functions".source = "${path}/functions";
    };
  };
}
