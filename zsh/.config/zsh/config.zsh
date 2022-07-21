# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach || tmux >/dev/null 2>&1
fi

zstyle :compinstall filename '/home/matthias/.config/zsh/config.zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export TERMINAL=alacritty

alias grep=grep --color

# load plugins
export ZPLUG_HOME=~/personal/zplug

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

