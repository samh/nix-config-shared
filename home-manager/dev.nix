# This is a home-manager configuration file for development machines.
{pkgs, ...}: {
  # You can import other home-manager modules here
  imports = [./global];
  home.packages =
    (with pkgs; [
      bat # cat/less with syntax highlighting
      bfs # A breadth-first version of the UNIX find command
      ripgrep # fast recursive grep (like a faster ack)
      shfmt # Formatter for shell scripts
      yadm # Dotfile manager
    ])
    # Add packages from nixpkgs-unstable.
    # Usually for things where we prefer the latest version.
    ++ (with pkgs.unstable; [
      distrobox # create podman containers with tight host integration
      rclone # manage files on cloud storage
    ]);

  #programs.git.enable = true;
}
