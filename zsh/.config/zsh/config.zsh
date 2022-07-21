# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux # tmux attach || tmux >/dev/null 2>&1
fi

zstyle :compinstall filename '/home/matthias/.config/zsh/config.zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# environment variables
export TERMINAL=alacritty
export XDG_CONFIG_HOME=~/.config
export ZPLUG_HOME=$XDG_CONFIG_HOME/zsh/zplug

# aliases
alias grep='rg --color'
alias ga='git add'
alias gf='git fetch --all'
alias gp='git pull'
alias gpu='git push'
alias gs='git status'
alias vim=nvim # best editor btw

# load plugins
source $ZPLUG_HOME/init.zsh

zplug "woefe/git-prompt.zsh"
zplug "jeffreytse/zsh-vi-mode"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

