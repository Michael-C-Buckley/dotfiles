{pkgs, ...}: let
  path = ../../configs/shells/nushell;
in {
  hjem.users.michael = {
    packages = [pkgs.nushell];
    xdg.config.files = {
      "nushell/env.nu".source = "${path}/env.nu";
      "nushell/config.nu".source = "${path}/config.nu";
      "nushell/abbreviations.nu".source = "${path}/abbreviations.nu";
      "nushell/git.nu".source = "${path}/git.nu";
      "nushell/prompt.nu".source = "${path}/prompt.nu";
    };
  };
}
