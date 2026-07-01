{pkgs, ...}: let
  path = ../configs/editor/helix;
in {
  hjem.users.michael = {
    packages = [pkgs.helix];
    xdg.config.files = {
      "helix/azen.toml".source = "${path}/azen.toml";
      "helix/config.toml".source = "${path}/config.toml";
      "helix/languages.toml".source = "${path}/languages.toml";
    };
  };
}
