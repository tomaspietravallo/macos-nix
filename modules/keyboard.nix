{ pkgs, ... }:

let
  enableLatinAmerican = pkgs.stdenv.mkDerivation {
    pname = "enable-latin-american-keyboard";
    version = "1";
    src = ../keyboard/enable-latin-american.c;
    dontUnpack = true;
    buildPhase = ''
      $CC "$src" -framework Carbon -framework CoreFoundation -o enable-latin-american-keyboard
    '';
    installPhase = ''
      mkdir -p "$out/bin"
      cp enable-latin-american-keyboard "$out/bin/"
    '';
  };
in
{
  system.defaults.hitoolbox.AppleFnUsageType = "Change Input Source";

  launchd.user.agents.enable-latin-american-keyboard.serviceConfig = {
    ProgramArguments = [ "${enableLatinAmerican}/bin/enable-latin-american-keyboard" ];
    RunAtLoad = true;
  };
}
