{ ... }:

{
  imports = [
    ./modules/development.nix
    ./modules/applications.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "tomaspietravallo";

  system.stateVersion = 6;
}
