let
  path = ../../configs/desktop;
in {
  hjem.users.michael.xdg.config.files = {
    "mimeapps.list".source = "${path}/mimeapps.list";
  };
}
