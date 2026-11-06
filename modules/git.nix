{ config, lib, pkgs, ... }:

let
  user = config.system.primaryUser;
  home = "/Users/${user}";
  fingerprint = "CBA9D8B070BD262CB265237C3CA041891FF67AEF";
  gpgConfig = pkgs.writeText "gpg.conf" ''
    default-key ${fingerprint}
  '';
  agentConfig = pkgs.writeText "gpg-agent.conf" ''
    pinentry-program ${pkgs.pinentry_mac}/bin/pinentry-mac
  '';
  gitConfig = {
    "core.editor" = "/run/current-system/sw/bin/vim";
    "user.name" = "Tomás Pietravallo";
    "user.email" = "hello@tomaspietravallo.com";
    "user.signingkey" = fingerprint;
    "gpg.format" = "openpgp";
    "gpg.program" = "${pkgs.gnupg}/bin/gpg";
    "commit.gpgsign" = "true";
    "tag.gpgsign" = "true";
  };
in
{
  environment.systemPackages = [ pkgs.gnupg pkgs.pinentry_mac ];

  system.activationScripts.postActivation.text = lib.mkAfter ''
    /usr/bin/install -d -m 0700 -o ${lib.escapeShellArg user} -g staff ${lib.escapeShellArg "${home}/.gnupg"}
    /usr/bin/install -m 0600 -o ${lib.escapeShellArg user} -g staff ${gpgConfig} ${lib.escapeShellArg "${home}/.gnupg/gpg.conf"}
    /usr/bin/install -m 0600 -o ${lib.escapeShellArg user} -g staff ${agentConfig} ${lib.escapeShellArg "${home}/.gnupg/gpg-agent.conf"}
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList (name: value: ''
      /usr/bin/sudo -H -u ${lib.escapeShellArg user} ${pkgs.git}/bin/git config --global ${lib.escapeShellArg name} ${lib.escapeShellArg value}
    '') gitConfig)}
    /usr/bin/sudo -H -u ${lib.escapeShellArg user} ${pkgs.gnupg}/bin/gpgconf --reload gpg-agent
  '';
}
