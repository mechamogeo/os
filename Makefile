# Minimal Makefile
NIX_FLAKES_BUILD_CMD = nix --extra-experimental-features 'nix-command flakes' build --
NIX_DARWIN_CMD = sudo ./result/sw/bin/darwin-rebuild switch --flake --

.PHONY: help setup personal update rollback

.DEFAULT_GOAL := help

help:
	@echo "Nix Darwin Dotfiles Commands:"
	@echo ""
	@echo "System Management:"
	@echo "  setup        Run setup"
	@echo "  update       Update the profile automatically"
	@echo "  rollback     Roll back to previous generation"
	@echo ""
	@echo "Profiles Management:"
	@echo "  personal     Apply personal profile"

setup:
	@echo "--> Running setup"
	xcode-select --install && \
	/usr/sbin/softwareupdate --install-rosetta --agree-to-license && \ # For Pulse.Red
	curl -sSf -L https://install.lix.systems/lix | sh -s -- install && \
	curl -sSf -L https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh -s


personal:
	@echo "--> Applying minimal configuration"
	$(NIX_FLAKES_BUILD_CMD) .#darwinConfigurations.personal.system
	$(NIX_DARWIN_CMD) switch --flake .#personal

update:
	@echo "--> Switching to new generation"
	switch

rollback:
	@echo "--> Rolling back to previous generation"
	$(NIX_DARWIN_CMD) rollback
