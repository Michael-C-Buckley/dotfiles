{pkgs, ...}: let
  path = ../../configs/terminal/kitty;
in {
  hjem.users.michael = {
    packages = [pkgs.kitty];
    xdg.config.files."kitty/kitty.conf".source = "${path}/kitty.conf";
  };
}
