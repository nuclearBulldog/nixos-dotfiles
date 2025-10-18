fastfetch -c examples/12.jsonc
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 3 numeric
zstyle :compinstall filename '/home/caleb/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob histignorealldups sharehistory
bindkey -v

source '/home/caleb/.config/zsh/antigen.zsh'

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle <<EOBUNDLES
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    casonadams/alacritty-shell
    raisty/alt-and-select
    Sam-programs/zsh-calc
    GeoLMg/apt-zsh-plugin
    zuxfoucault/colored-man-pages_mod
    aemonge/zsh-hookie-projects
    chrissicool/zsh-256color
    z-shell/zsh-fancy-completions
    zdharma-continuum/zui
EOBUNDLES

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# My aliases;

alias cls="clear"
alias v="nvim"
alias sv="sudoedit"
alias e="emacs"
alias ff="fastfetch"

# End of lines configured by zsh-newuser-install

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
