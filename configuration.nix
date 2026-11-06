{ pkgs, ... }:

{
  imports = [
    ./modules/development.nix
    ./modules/applications.nix
    ./modules/privacy.nix
    ./modules/git.nix
    ./modules/npm.nix
    ./modules/raycast.nix
    ./modules/keyboard.nix
    ./modules/fonts.nix
    ./macos-nix-secrets
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "tomaspietravallo";

  security.pam.services.sudo_local.touchIdAuth = true;

  nix.package = pkgs.lixPackageSets.stable.lix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  homebrew.enable = true;

  system.stateVersion = 6;
}
