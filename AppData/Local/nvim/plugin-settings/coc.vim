Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter'
  
" Coc
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
nnoremap <silent> K <cmd>call CocActionAsync('doHover')<cr>
nnoremap <silent> <F2> <Plug>(coc-rename)
nmap <silent> <C-k> <Plug>(coc-codeaction-cursor)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = ['coc-css', 'coc-docker', 'coc-emmet', 'coc-eslint', 'coc-html', 'coc-json', 'coc-lightbulb', 'coc-markdownlint', 'coc-rust-analyzer', 'coc-yaml', 'coc-eslint', 'coc-tsserver', 'coc-discord-rpc', 'coc-lua']


" ESLint
autocmd InsertLeave *.ts,*.tsx call s:eslintfix()
autocmd TextChanged *.ts,*.tsx call s:eslintfix()

let s:eslintRunning = v:false
let s:eslintShouldRerun = v:false
function! s:eslintfix()
  if s:eslintRunning
    let s:eslintShouldRerun = v:true
  else
    let s:eslintRunning = v:true
    let s:eslintShouldRerun = v:false
    lua require('notify')(' ESLint Autofix Running...', 'info', { timeout = 500, render = 'minimal', stages = 'fade' })
    CocCommand eslint.executeAutofix
    call timer_start(1000, { _ -> [execute("let s:eslintRunning = v:false"), s:eslintShouldRerun && s:eslintfix()]})
  endif
endfunction


function! s:eslintfix_timer(timer)
  call s:eslintfix()
endfunction

