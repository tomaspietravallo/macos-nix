{ ... }:

{
  imports = [
    ./modules/development.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
}
