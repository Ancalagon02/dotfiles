zstyle ':completion::completion:*' gain-privileges 1
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

alias ls="ls --color=auto"
alias vim="nvim"

export EDITOR="nvim"

source <(fzf --zsh)

eval "$(oh-my-posh init zsh)"
