{ ... }:

{
  imports = [
    ./modules/development.nix
    ./modules/applications.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "tomaspietravallo";

  homebrew.enable = true;

  system.stateVersion = 6;
}
