{pkgs, ...}: let
  path = ../../configs/shells/bash;
in {
  hjem.users.michael = {
    packages = [pkgs.bash];
    files = {
      ".bashrc".source = "${path}/bashrc";
      ".bash_profile".source = "${path}/bash_profile";
    };
  };
}
