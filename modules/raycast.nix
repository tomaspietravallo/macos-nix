{ config, lib, ... }:

let
  user = config.system.primaryUser;
  directory = "/Users/${user}/Library/Application Support/Raycast Script Commands";
  scripts = [ "toggle-hide-desktop.sh" "documents.sh" "downloads.sh" ];
in
{
  system.activationScripts.postActivation.text = lib.mkAfter ''
    /usr/bin/install -d -m 0755 -o ${lib.escapeShellArg user} -g staff ${lib.escapeShellArg directory}
    ${lib.concatMapStringsSep "\n" (name: ''
      /usr/bin/install -m 0755 -o ${lib.escapeShellArg user} -g staff ${../raycast/scripts + "/${name}"} ${lib.escapeShellArg "${directory}/${name}"}
    '') scripts}
  '';
}
