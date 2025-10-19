{ pkgs, inputs, ... }:

let
  inherit (builtins) attrValues;
in

{
  home.packages = attrValues {
    inherit
      (pkgs)
      libreoffice-fresh
      bat
      tldr
      fastfetch
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
      ;
  };
}
