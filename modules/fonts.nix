{ config, lib, ... }:

let
  fontDirectory = "/Users/${config.system.primaryUser}/Documents/sabf-fonts";
in
{
  system.activationScripts.postActivation.text = lib.mkAfter ''
    font_source=${lib.escapeShellArg fontDirectory}
    if [[ -d "$font_source" ]]; then
      for font in "$font_source"/*.otf; do
        [[ -f "$font" ]] || continue
        target="/Library/Fonts/''${font##*/}"
        if [[ -e "$target" ]] && ! /usr/bin/cmp -s "$font" "$target"; then
          printf 'Font already exists with different contents: %s\n' "$target" >&2
          exit 1
        fi
      done
      for font in "$font_source"/*.otf; do
        [[ -f "$font" ]] || continue
        target="/Library/Fonts/''${font##*/}"
        if [[ ! -e "$target" ]]; then
          /usr/bin/install -m 0644 "$font" "$target"
        fi
      done
    else
      printf 'Local font directory not found: %s\n' "$font_source" >&2
    fi
  '';
}
