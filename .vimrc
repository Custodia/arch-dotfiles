syntax on

set nocompatible
set backspace=2

autocmd Filetype gitcommit set textwidth=72

set number
set relativenumber

function! NumberToggle()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber

