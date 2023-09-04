if has("nvim")
    " include lua configuration
    lua require("user")
else
    " set relative line numbers
    set rnu nu
    " enable line reordering with alt + j/k
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
    set tabstop=4
    set shiftwidth=4
    set smartindent
    set signcolumn=yes
endif
