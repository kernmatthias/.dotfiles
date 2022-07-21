## Private configs
for all things in my config

### Usage

A clone of this repo should be placed into a subdir of your home directory (e.g. ~/.dotfiles).

Now
```
stow <dir>
```
creates symbolic links from the specified directory into the parent directory.

--- 

For example, 
```
stow neovim
```
will create the following link
```
~/.config/nvim -> ~/.dotfiles/neovim/.config/nvim
```

### Insipired by 
 - [@ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles)
 - [@BashBunni](https://github.com/bashbunni/dotfiles)
 - [@TJDevries](https://github.com/tjdevries/config_manager)

