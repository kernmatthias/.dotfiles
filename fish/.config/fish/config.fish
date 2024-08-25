fish_hybrid_key_bindings

set -x PATH "$HOME/.local/bin" "$HOME/.cargo/bin" $PATH

if test -x "$(command -v tmux)" && test -n "$DISPLAY" && test -z "$TMUX"
	tmux
	tmux-sessionizer
end

# env vars
set TERMINAL "alacritty"
set XDG_CONFIG_HOME "$HOME/.config/"
set DOTFILES "$HOME/.dotfiles"

set -x EDITOR "nvim"

alias grep "grep --color"
alias ga "git add"
alias gb "git branch"
alias gc "git commit"
alias gd "git diff"
alias gf "git fetch --all -v"
alias gp "git pull"
alias gpr "git pull --rebase"
alias gpu "git push"
alias gr "git rebase -i"
alias gs "git status"
alias gsw "git switch"

alias v "$EDITOR ./"

alias ll "lsd -la"
alias ls "lsd"

# add the functions (which are not in the autoload directory)
source "$XDG_CONFIG_HOME/fish/functions.fish"
