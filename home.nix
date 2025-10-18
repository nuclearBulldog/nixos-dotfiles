{ config, pkgs, ... }:

let
  dotFiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  createSymLink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    qtile = "qtile";
    nvim = "nvim";
    rofi = "rofi";
  };
in

{
  home.username = "caleb";
  home.homeDirectory = "/home/caleb";
  home.stateVersion = "25.05";
  programs.git = {
    enable = true; # Enables Git configuration through Home Manager
    userName = "nuclearBulldog";
    userEmail = "dellowcaleb@outlook.com";
    extraConfig = {
      core.editor = "nvim";

    };
  };
  programs.zsh = {
    enable = true;
    zplug.enable = true;
    zplug.plugins = [
      { src = "unixorn/autoupdate-zsh-plugin"; }
      { src = "zsh-users/zsh-syntax-highlighting"; use = "zsh-syntax-highlighting.zsh"; }
      { src = "zsh-users/zsh-history-substring-search"; }
      { src = "plugins/git"; }
    ];

  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      cls = "clear";
      v = "vim";
      btw = "echo i use LOOnix btw";
      update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#cdell";
    };
  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = createSymLink "${dotFiles}/${subpath}";
      recursive = true;
    })
    configs;


  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    rofi
    git-credential-manager
    unzip
  ];
}

