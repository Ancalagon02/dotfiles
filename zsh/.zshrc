zstyle ':completion::completion:*' gain-privileges 1
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

alias ls="ls --color=auto"
alias vim="nvim"
alias dotfiles="cd /mnt/devops/dotfiles"
alias games="cd /mnt/games"
alias nas="cd /mnt/nas"
alias devops="cd /mnt/devops/"

source <(fzf --zsh)


eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

