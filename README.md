# Nix Shared Configuration

This repository is intended to contain Nix/NixOS configuration that can be
used across my personal and work configurations.

## Quick Reference
| Command | Description |
| --- | --- |
| `nix flake update --commit-lock-file` | Update all flake dependencies |
| `nix fmt` | Format all Nix files |
| `nh home switch -a -c samh@dev-gui .` | Apply home configuration using `nh` |

## Non-NixOS Home Manager Configuration
- Run the initial setup ("Standalone setup" is the only option for non-NixOS;
  use the Flakes version); possible options:
  - `nix run home-manager/release-24.05 -- switch --flake .`
  - `nix shell home-manager#home-manager` (not sure which release this uses)
- Run `home-manager switch --flake .` to apply your home
  configuration (defaults to your username, or you can explicitly use flake
  `.#username@hostname`)
  - For example, `home-manager switch --flake .#samh@dev-gui`
- To make this the default for `home-manager switch` (without an explicit flake),
  you can link it to the default location: `ln -s $(pwd) ~/.config/home-manager`
