vim.api.nvim_set_var('lightspeed_no_default_keymaps', true)

return {
  {
    'ggandor/lightspeed.nvim',
    config = function()
      vim.keymap.set('n', 's', '<Plug>Lightspeed_omni_s', { remap = true, expr = false, silent = false })
    end
  }
}

