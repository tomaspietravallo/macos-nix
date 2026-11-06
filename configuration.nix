{ pkgs, ... }:

{
  # Mac architecture
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Packages available system-wide
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
  ];

  # Used for backwards compatibility
  system.stateVersion = 6;
}
