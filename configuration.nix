{ pkgs, ... }:

{
  imports = [
    ./modules/development.nix
    ./modules/applications.nix
    ./modules/privacy.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "tomaspietravallo";

  nix.package = pkgs.lixPackageSets.stable.lix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  homebrew.enable = true;

  system.stateVersion = 6;
}
