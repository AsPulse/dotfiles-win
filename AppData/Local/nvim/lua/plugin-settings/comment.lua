local modules = {
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  }
}

-- nnoremap <F12> <cmd>CommentToggle<cr>
-- vnoremap <F12> <cmd>'<,'>CommentToggle<cr>

vim.keymap.set('n', '<F12>', '<cmd>CommentToggle<cr>', { silent = true, remap = false })
vim.keymap.set('v', '<F12>', '<cmd>\'<,\'>CommentToggle<cr>', { silent = true, remap = false })


return modules
