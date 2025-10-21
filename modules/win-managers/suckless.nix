{ pkgs, ... }:

{

  home.packages = with pkgs; [
    (pkgs.st.overrideAttrs (_: {
      src = ../config/st;
      patches = [ ];
    }))
    (pkgs.dmenu.overrideAttrs (_: {
      src = ../config/dmenu;
      patches = [ ];
    }))
    (pkgs.slock.overrideAttrs (_: {
      src = ../config/slock;
      patches = [ ];
    }))
    (pkgs.dwmblocks.overrideAttrs (_: {
      src = ../config/dwmblocks-async;
      patches = [ ];
    }))
    surf
  ];

}
