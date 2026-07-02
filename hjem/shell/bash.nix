{pkgs, ...}: let
  path = ../../configs/shells/bash;
in {
  hjem.users.michael = {
    packages = [pkgs.bash];
    files = {
      ".bashrc" = {
        source = "${path}/bashrc";
        clobber = false;
      };
      ".bash_profile" = {
        source = "${path}/bash_profile";
        clobber = false;
      };
    };
  };
}
