final: prev: {
  # Override packages with nix-ai-tools versions
  gemini-cli = final.nix-ai-tools.packages.${final.system}.gemini-cli;
  copilot-cli = final.nix-ai-tools.packages.${final.system}.copilot-cli;
  spec-kit = final.nix-ai-tools.packages.${final.system}.spec-kit;
}
