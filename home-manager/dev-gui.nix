# This is a home-manager configuration file for development machines,
# plus GUI packages.
{pkgs, ...}: {
  # You can import other home-manager modules here
  imports = [./dev.nix];
  home.packages = with pkgs; [
    vscode
  ];
}
