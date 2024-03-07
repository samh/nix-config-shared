# This is a home-manager configuration file for development machines
# (terminal packages; GUIs should be in a separate config)
{pkgs, ...}: {
  # You can import other home-manager modules here
  imports = [./global];
  home.packages =
    (with pkgs; [
      bat # cat/less with syntax highlighting
      bfs # A breadth-first version of the UNIX find command
      dua # Disk usage analyzer (like ncdu)
      ripgrep # fast recursive grep (like a faster ack)
      shellcheck # Linter for shell scripts
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
  programs.yazi.enable = true; # terminal file manager
  programs.zoxide.enable = true; # 'cd' replacement

  # To make this work with yadm, need to set up zshrc
  # to source .commonrc and move .zshenv (maybe source
  # .zshenv.yadm from home-manager .zshenv?)
  #programs.zsh.enable = true;
}
