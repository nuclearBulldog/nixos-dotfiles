{ pkgs, ... }:

{

  home.packages = with pkgs; [
    (pkgs.st.overrideAattrs (_: {
      src = ../config/st;
      patches = [ ];
    }))
    (pkgs.dmenu.overrideAattrs (_: {
      src = ../config/dmenu-flexipatch;
      patches = [ ];
    }))
    slock
    surf
  ];

}
