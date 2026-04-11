zstyle ':completion::completion:*' gain-privileges 1
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

export PATH=$PATH:$HOME/.local/opt/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin

alias ls="ls --color=auto"
alias vim="nvim"
alias dotfiles="cd /devops/dotfiles"
alias games="cd /games"
alias nas="cd /mnt/nas"
alias devops="cd /devops/"
alias course="cd /devops/Udemy/"
alias hois='cd "/home/wesley/.local/share/Paradox Interactive/Hearts of Iron IV/save games"'

source <(fzf --zsh)
export MANPAGER="nvim +Man!"
export hoisaves="/home/wesley/.local/share/Paradox Interactive/Hearts of Iron IV/save games"

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

