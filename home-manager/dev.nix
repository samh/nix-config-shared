# This is a home-manager configuration file for development machines.
{pkgs, ...}: {
  # You can import other home-manager modules here
  imports = [./global];
  home.packages =
    (with pkgs; [
      shfmt # Formatter for shell scripts
      yadm # Dotfile manager
    ])
    # Add packages from nixpkgs-unstable.
    # Usually for things where we prefer the latest version.
    ++ (with pkgs.unstable; [
      rclone # manage files on cloud storage
    ]);

  #programs.git.enable = true;
}
