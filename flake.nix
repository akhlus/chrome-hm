{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: {
    homeConfigurations."sam" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages."aarch64-linux";
      modules = [
        ./home.nix
      ];
      extraSpecialArgs = {
        inherit inputs;
        flakePath = "/home/sam/chrome-hm";
      };
    };
  };
  inputs = {
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
}
