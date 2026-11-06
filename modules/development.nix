{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
    pre-commit
    rclone
    rsync
    awscli2
  ];

  homebrew.casks = [
    "codex"
    "claude-code"
  ];

  system.stateVersion = 6;
}
