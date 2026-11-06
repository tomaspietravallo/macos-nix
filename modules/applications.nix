{ ... }:

{
  homebrew.taps = [
    "sozercan/repo"
  ];

  homebrew.masApps = {
    Amphetamine = 937984704;
    WireGuard = 1451685025;
  };

  homebrew.brews = [
    "wireguard-tools"
  ];

  homebrew.casks = [
    "raycast"
    "google-chrome"
    "adobe-creative-cloud"
    "ghostty"
    "sozercan/repo/kaset" # YouTube Music app
  ];
}
