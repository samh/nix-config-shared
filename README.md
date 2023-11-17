# Nix Shared Configuration

This repository is intended to contain Nix/NixOS configuration that can be
used across my personal and work configurations.

## Quick Reference
| Command | Description |
| --- | --- |
| `nix flake update --commit-lock-file` | Update all flake dependencies |
| `nix fmt` | Format all Nix files |

## Non-NixOS Home Manager Configuration

- Run `home-manager switch --flake .` to apply your home
  configuration (defaults to your username, or you can explicitly use flake
  `.#username@hostname`)
  - If you don't have home-manager installed, try `nix shell home-manager#home-manager`.
- To make this the default for `home-manager switch` (without an explicit flake),
  you can link it to the default location: `ln -s $(pwd) ~/.config/home-manager`
