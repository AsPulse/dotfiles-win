Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'

let g:fern#renderer = "nerdfont"
let g:fern#default_hidden=1
let g:fern#renderer#nerdfont#indent_markers = 1
function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

nmap <silent> root gg<Plug>(fern-action-cd)

let g:sneak#label = 1

nnoremap <C-f> <cmd>Fern . -reveal=%<cr>
