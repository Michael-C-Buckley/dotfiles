{pkgs, ...}: let
  path = ../../configs/shells/nushell;
in {
  hjem.users.michael = {
    packages = [pkgs.nushell];
    xdg.config.files = {
      "nushell/env.nu" = {
        source = "${path}/env.nu";
        clobber = false;
      };
      "nushell/config.nu" = {
        source = "${path}/config.nu";
        clobber = false;
      };
      "nushell/abbreviations.nu" = {
        source = "${path}/abbreviations.nu";
        clobber = false;
      };
      "nushell/git.nu" = {
        source = "${path}/git.nu";
        clobber = false;
      };
      "nushell/prompt.nu" = {
        source = "${path}/prompt.nu";
        clobber = false;
      };
    };
  };
}
