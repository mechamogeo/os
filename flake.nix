{
  description = "@mechamogeo machines autosetup";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    darwin = { url = "github:LnL7/nix-darwin/master"; inputs.nixpkgs.follows = "nixpkgs"; };
    disko = { url = "github:nix-community/disko"; inputs.nixpkgs.follows = "nixpkgs"; };
    mac-app-util = { url = "github:hraban/mac-app-util"; inputs.cl-nix-lite.url = "github:r4v3n6101/cl-nix-lite/url-fix"; };
    nix-ai-tools = { url = "github:numtide/nix-ai-tools"; inputs.nixpkgs.follows = "nixpkgs"; };
  };
  outputs = { self, darwin, home-manager, nixpkgs, disko, mac-app-util, nix-ai-tools }@inputs:
    let
      user = "mechamogeo";
      email = "hi@geovani.dev";
      darwinSystems = [ "aarch64-darwin" ];
      darwinApps = import ./apps/darwin.nix { inherit self nixpkgs email; };
    in
    {
      apps = nixpkgs.lib.genAttrs darwinSystems darwinApps;

      darwinConfigurations = {
        personal = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = inputs // { inherit user email; };
          modules = [
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            ./overlays
            ./hosts/darwin/personal.nix
          ];
        };
      };
    };
}
