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
      nh # Yet another nix cli helper
      nix-tree
      ripgrep # fast recursive grep (like a faster ack)
      shellcheck # Linter for shell scripts
      shfmt # Formatter for shell scripts
      yadm # Dotfile manager
    ])
    # Add packages from nixpkgs-unstable.
    # Usually for things where we prefer the latest version.
    ++ (with pkgs.unstable; [
      aider-chat # Terminal AI tool (NOTE: adds a lot of dependencies, ~2.24GB)
      distrobox # create podman containers with tight host integration
      rclone # manage files on cloud storage
      restic # backup tool
    ]);
  home.shellAliases = {
    "venv" = "uv venv --seed";
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    # git.enable = true;
    yazi.enable = true; # terminal file manager
    zoxide.enable = true; # 'cd' replacement
    # To make programs.zsh work with yadm, need to set up zshrc
    # to source .commonrc and move .zshenv (maybe source
    # .zshenv.yadm from home-manager .zshenv?)
    zsh = {
      enable = true;
      initExtra = ''
        # Source common init from yadm if it exists
        if [ -f ~/.commonrc ]; then
          source ~/.commonrc
        fi

        source ~/.zsh-keyboard-mapping
      '';
      history = {
        append = true;
        extended = true;
        ignoreAllDups = true;
        ignorePatterns = [
          "rm *"
          "pkill *"
          "cp *"
        ];
        # Do not enter command lines into the history list if the first
        # character is a space.
        ignoreSpace = true;
        size = 1000000000;
      };
    };
  };
  home.file.".zsh-keyboard-mapping" = {
    source = ./zsh-keyboard-mapping.zsh;
  };
}
