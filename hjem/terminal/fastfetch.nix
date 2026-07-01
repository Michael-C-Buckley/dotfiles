{pkgs, ...}: let
  path = ../../configs/terminal/fastfetch;
in {
  hjem.users.michael = {
    packages = [pkgs.fastfetch];
    xdg.config.files."fastfetch/config.jsonc".source = "${path}/linux.jsonc";
  };
}
