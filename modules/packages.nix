{ pkgs, inputs, ... }:

let
  inherit (builtins) attrValues;
in

{
  home.packages = attrValues {
    inherit
      (pkgs)
      hyprpaper
      wireshark
      wofi
	  qimgv
      gimp3-with-plugins
      imagemagick
      libheif
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
      localsend
      ;
  };
}
