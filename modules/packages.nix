#{ pkgs, inputs, ... }:

#let
#  inherit (builtins) attrValues;
#in

#{
#  environment.systemPackages = attrValues {
#    inherit
#      (pkgs)
#      libreoffice-fresh
#      clang
#      gnumake
#      cargo
#      go
#     gcc
#      onefetch
#      cpufetch
#      microfetch
#      ;
#  };
#}
