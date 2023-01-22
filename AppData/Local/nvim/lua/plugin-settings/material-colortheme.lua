function Material_colortheme_customMap()
  vim.cmd [[highlight @field guifg=#a6accd]]
  vim.cmd [[highlight @property guifg=#ffcb6b]]
  vim.cmd [[highlight ModeMsg guifg=#303030]]
end


vim.api.nvim_create_autocmd({ 'SourcePost' }, {
  pattern = { '*' },
  callback = vim.schedule_wrap(Material_colortheme_customMap)
})

return {
  {
    'marko-cerovac/material.nvim',
    config = function()
      require('material').setup({
        lualine_style = 'default',
        custom_colors = function(colors)
          colors.editor.accent = '#c792ea'
          colors.editor.line_numbers = '#6562a3'
        end
      })
      vim.g.material_style = 'palenight'
      vim.cmd 'colorscheme material'
      Material_colortheme_customMap()
    end
  }
}


