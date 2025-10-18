{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = { };
    antidote = {
      enable = true;
      plugins = [
        ''
          zsh-users/zsh-syntax-highlighting
          zsh-users/zsh-autosuggestions
          zsh-users/zsh-completions
          raisty/alt-and-select
          Sam-programs/zsh-calc
          GeoLMg/apt-zsh-plugin
          zuxfoucault/colored-man-pages_mod
          aemonge/zsh-hookie-projects
          chrissicool/zsh-256color
          z-shell/zsh-fancy-completions
          zdharma-continuum/zui
          ohmyzsh/ohmyzsh path:lib/git.zsh
          ohmyzsh/ohmyzsh path:lib/pip.zsh
          ohmyzsh/ohmyzsh path:lib/command-not-found.zsh     
        ''
      ];
    };
  };
}
