{ ... }:

{
  system.defaults = {
    CustomUserPreferences."com.apple.Safari" = {
      # Disable Safari Suggestions and automatic opening of downloads.
      UniversalSearchEnabled = false;
      SuppressSearchSuggestions = true;
      AutoOpenSafeDownloads = false;
    };

    # Require a password immediately after sleep or the screen saver starts.
    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };

    # Avoid creating .DS_Store files on network and USB volumes.
    CustomUserPreferences."com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };
  };
}
