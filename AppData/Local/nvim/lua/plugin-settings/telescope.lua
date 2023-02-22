return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true,
    tag = '0.1.0',
    init = function()
      local builtin = function(name)
        return function ()
          require('telescope.builtin')[name]()
        end
      end

      vim.keymap.set('n', '<leader>ff', builtin('find_files'), {})
      vim.keymap.set('n', '<leader>fg', builtin('live_grep'), {})
      vim.keymap.set('n', '<leader>fb', builtin('buffers'), {})
      vim.keymap.set('n', '<leader>fh', builtin('help_tags'), {})
      vim.keymap.set('n', '<leader>fd', builtin('diagnostics'), {})
    end
  }
}
