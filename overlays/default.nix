{ nix-ai-tools, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      nix-ai-tools = nix-ai-tools;
    })
    (import ./nix-ai-tools.nix)
  ];
}
