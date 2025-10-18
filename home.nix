{ config, pkgs, ... }:

let
  dotFiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  createSymLink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    qtile = "qtile";
    nvim = "nvim";
    rofi = "rofi";
    picom = "picom";
    dwm = "dwm";
    dmenu = "dmenu";
    dwmblocks-async = "dwmblocks-async";
    slock = "slock";
    st = "st";
  };
in

{

  imports =
    [
      ./modules/suckless.nix
    ];


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
      v = "nvim";
      btw = "echo i use LOOnix btw";
      nix-update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#cdell";
      nix-config = "nvim ~/nixos-dotfiles/configuration.nix";
      nix-home-config = "nvim ~/nixos-dotfiles/home.nix";
      nix-commit-dots = "cd ~/nixos-dotfiles && git add . && git commit -m 'Automated commit'";
    };
    initExtra = ''
      export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
    '';

  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = createSymLink "${dotFiles}/${subpath}";
      recursive = true;
    })
    configs;


  home.packages = with pkgs; [
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    rofi
    git-credential-manager
    unzip
    feh
  ];
}

