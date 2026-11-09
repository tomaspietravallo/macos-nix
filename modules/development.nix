{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.systemPackages = with pkgs; [
    nodejs_26
    jdk25
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
    "stablyai/orca"
  ];

  homebrew.brews = [
    "hashicorp/tap/terraform"
  ];

  homebrew.casks = [
    "stablyai/orca/orca"
    "docker-desktop"
    "visual-studio-code"
    "codex"
    "codex-app"
    "claude-code"
  ];

  system.stateVersion = 6;
}
