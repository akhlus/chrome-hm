{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: let
    settings = rec {
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "samuellarcombe@gmail.com"; #for git
      flakePath = "/home/${name}/chrome-hm"; #full path
      system = "aarch64-linux";
    };
    pkgs = inputs.nixpkgs.legacyPackages.${settings.system};
    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${settings.system};
  in {
    homeConfigurations."home" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
      ];
      extraSpecialArgs = {
        inherit pkgs-stable settings inputs;
      };
    };
  };
  inputs = {
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    #nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
}
