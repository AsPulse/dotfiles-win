local modules = {
  {
    'terrortylor/nvim-comment',
    event = 'BufEnter *.*',
    config = function()
      require('nvim_comment').setup()
    end
  }
}

vim.keymap.set('n', '<F12>', '<cmd>CommentToggle<cr>', { silent = true, remap = false })
vim.keymap.set('v', '<F12>', '<cmd>\'<,\'>CommentToggle<cr>', { silent = true, remap = false })


return modules
