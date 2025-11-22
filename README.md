# @mechamogeo/os

Darwin automated configuration with Nix.

## Features

- **Nix Darwin**: System-level configuration management
- **Home Manager**: User-level configuration and dotfiles

## Quick Start

```bash
# Setup
make setup

## Run the profile for first time setup
make personal

## Update the profile automatically
make update

## Rollback to the profile changes applied
make rollback
```

To modify the configuration, edit the relevant `.nix` files and run `make` with the desired profile. <br/>
❤️ Special Thanks to [Liam](https://github.com/liamawhite) and [Gab Fontes](https://github.com/Misterio77) for their repo's inspiration.
