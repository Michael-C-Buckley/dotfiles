{pkgs, ...}: let
  path = ../../configs/shells/zsh;
in {
  hjem.users.michael = {
    packages = [pkgs.zsh];
    files.".zshrc".source = "${path}/zshrc";
  };
}
