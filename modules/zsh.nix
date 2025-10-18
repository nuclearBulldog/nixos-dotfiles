{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (pkgs.zsh.overrideAttrs (_: {
      src = ../config/zsh;
    }))
    antigen
  ];
}
