function Material_colortheme_customMap()
  vim.cmd [[highlight @field guifg=#a6accd]]
  vim.cmd [[highlight @property guifg=#ffcd6b]]
  vim.cmd [[highlight ModeMsg guifg=#303030]]
  vim.cmd [[highlight CocFloating guibg=#202331]]
  vim.cmd [[highlight CocMenuSel guifg=#e63e73 guibg=#403d59]]
  vim.cmd [[highlight CocPumSearch guifg=#82aaff]]
end

vim.schedule(
  function()
    if vim.g.colorscheme_material_loaded then
      vim.cmd 'colorscheme material'
      Material_colortheme_customMap()
    end
  end
)

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
      vim.g.colorscheme_material_loaded = true
    end
  }
}


