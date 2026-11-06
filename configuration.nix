{ ... }:

{
  imports = [
    ./modules/development.nix
    ./modules/applications.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
}
