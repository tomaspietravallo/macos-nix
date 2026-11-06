{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
  ];

  homebrew.casks = [
    "codex"
    "claude-code"
  ];

  system.stateVersion = 6;
}
