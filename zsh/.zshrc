autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

alias ls="ls --color=auto"
alias vim="nvim"
alias dotfiles="cd /devops/dotfiles"
alias games="cd /games"
alias nas="cd /mnt/nas"
alias devops="cd /devops/"
alias course="cd /devops/Udemy/"
alias hois='cd "/home/wesley/.local/share/Paradox Interactive/Hearts of Iron IV/save games"'

source <(fzf --zsh)

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
