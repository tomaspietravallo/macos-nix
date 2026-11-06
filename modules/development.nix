{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.systemPackages = with pkgs; [
    git
    gh
    lazygit
    vim
    curl
    wget
    pre-commit
    rclone
    rsync
    awscli2
    google-cloud-sdk
  ];

  homebrew.taps = [
    "hashicorp/tap"
  ];

  homebrew.brews = [
    "hashicorp/tap/terraform"
  ];

  homebrew.casks = [
    "docker-desktop"
    "visual-studio-code"
    "codex"
    "codex-app"
    "claude-code"
  ];

  system.stateVersion = 6;
}
