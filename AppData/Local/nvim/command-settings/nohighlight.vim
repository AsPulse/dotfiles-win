nnoremap <silent> <F3> <cmd>noh<cr>
autocmd InsertEnter * lua vim.schedule(vim.cmd.nohlsearch)
