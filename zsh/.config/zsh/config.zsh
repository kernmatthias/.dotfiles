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
export XDG_CONFIG_HOME=$HOME/.config
export ZPLUG_HOME=$XDG_CONFIG_HOME/zsh/zplug
export DOTFILES=$HOME/.dotfiles

# path
path+="$HOME/.local/bin"
path+="$HOME/.cargo/bin"

# aliases
alias grep="grep --color"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gf="git fetch --all -v"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gpu="git push"
alias gr="git rebase -i"
alias gs="git status"
alias gsw="git switch"
#alias vim="nvim"
#alias nvimdiff="nvim -d"
#alias vimdiff="nvim -d"

# load functions
source "$XDG_CONFIG_HOME/zsh/functions.zsh"

# load private env vars
[ -f ~/personal/env_vars.zsh ] && source ~/personal/env_vars.zsh

# vunit env vars
export VUNIT_SIMULATOR="modelsim"
export VUNIT_MODELSIM_PATH="/opt/intelFPGA/21.1/questa_fse/bin"

# load plugins
source $ZPLUG_HOME/init.zsh

zplug "nvbn/thefuck"
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "jeffreytse/zsh-vi-mode"
zplug "wting/autojump"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# load powerlevel10k
source $XDG_CONFIG_HOME/zsh/p10k.zsh

# disable prompt
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
