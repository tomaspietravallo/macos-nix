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
  nixpkgs.overlays = [
    (_: prev: {
      pre-commit = prev.pre-commit.override {
        dotnetCorePackages = { sdk_8_0-source = { meta.platforms = [ ]; }; };
      };
    })
  ];

  system.primaryUser = "tomaspietravallo";

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;
    autohide-time-modifier = 0.0;
  };

  nix.package = pkgs.lixPackageSets.stable.lix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  homebrew.enable = true;

  system.stateVersion = 6;
}
