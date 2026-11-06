{
  description = "My macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "git+https://github.com/Mic92/sops-nix?shallow=1";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, sops-nix }: {
    darwinConfigurations."Tomass-MacBook-Pro" =
      nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
          sops-nix.darwinModules.sops
        ];
      };
  };
}
