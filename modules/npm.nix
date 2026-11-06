{ ... }:

{
  environment.etc."npmrc".source = ../npm/npmrc;
  environment.variables.NPM_CONFIG_GLOBALCONFIG = "/etc/npmrc";
  environment.extraInit = ''
    case ":$PATH:" in
      *:"$HOME/.npm-global/bin":*) ;;
      *) export PATH="$PATH:$HOME/.npm-global/bin" ;;
    esac
  '';
}
