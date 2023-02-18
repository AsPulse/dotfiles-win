return {
  {
    'lambdalisue/fern.vim',
    config = function()
      vim.api.nvim_set_var('fern#renderer', 'nerdfont')
      vim.api.nvim_set_var('fern#default_hidden', true)
      vim.api.nvim_set_var('fern#renderer#nerdfont#indent_markers', true)

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = { 'fern' },
        callback = function()
          vim.keymap.set(
            'n', '<Plug>(fern-action-open)', '<Plug>(fern-action-open:select)',
            { buffer = true, remap = true}
          )
          vim.keymap.set(
            'n', 'cwd', 'gg<Plug>(fern-action-cd)',
            { buffer = true, silent = true, remap = false }
          )
        end
      })

      vim.keymap.set('n', '<C-f>', '<cmd>Fern . -reveal=%<cr>', { noremap = true })
    end
  },
  { 'lambdalisue/nerdfont.vim', dependencies = { 'lambdalisue/fern.vim' } },
  { 'lambdalisue/fern-renderer-nerdfont.vim', dependencies = { 'lambdalisue/fern.vim', 'lambdalisue/nerdfont.vim' } },
  { 'lambdalisue/fern-hijack.vim', dependencies = { 'lambdalisue/fern.vim' } },
}
