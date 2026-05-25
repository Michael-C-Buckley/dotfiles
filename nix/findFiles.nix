# Returns list of attrs
# My intended use is to create github:feel-co/smfh compatible manifests for linking
{
  dir,
  username ? "michael",
}: let
  recurse = prefix: path: let
    entries = builtins.readDir path;
    names = builtins.attrNames entries;

    visit = name: let
      child = path + "/${name}";
      relPath =
        if prefix == ""
        then name
        else "${prefix}/${name}";
      type = entries.${name};
    in
      if type == "directory"
      then recurse relPath child
      else [
        {
          target = "/home/${username}/${relPath}";
          sources = toString child;
          type = "symlink";
        }
      ];
  in
    builtins.concatLists (map visit names);
in
  recurse "" dir
