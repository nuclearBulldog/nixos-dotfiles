{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cls = "clear";
      v = "nvim";
      nix-update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#cdell";
      nix-config = "nvim ~/nixos-dotfiles/configuration.nix";
      nix-home-config = "nvim ~/nixos-dotfiles/home.nix";
      nix-commit-dots = "cd ~/nixos-dotfiles && git add . && git commit -m 'Automated commit'";
      nix-push-dots = "cd ~/nixos-dotfiles && git push origin";
    };

    antidote = {
      enable = true;
      plugins = [
        ''
          zsh-users/zsh-syntax-highlighting
          zsh-users/zsh-autosuggestions
          zsh-users/zsh-completions
          raisty/alt-and-select
          zuxfoucault/colored-man-pages_mod
          aemonge/zsh-hookie-projects
          chrissicool/zsh-256color
          z-shell/zsh-fancy-completions
        ''
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ./p10k-config;
          file = "p10k.zsh";
        }
      ];
    };
  };
}
