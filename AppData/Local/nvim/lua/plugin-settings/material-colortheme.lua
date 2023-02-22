function Material_colortheme_customMap()
  require('material').setup({
    lualine_style = 'default',
    async_loading = false,
    custom_colors = function(colors)
      colors.editor.accent = '#c792ea'
      colors.editor.line_numbers = '#6562a3'
      colors.editor.bg = "#1e1e2e"
    end
  })
  vim.g.material_style = 'palenight'
  vim.cmd [[colorscheme material]]

  vim.cmd [[highlight @field guifg=#a6accd]]
  vim.cmd [[highlight @property guifg=#ffcd6b]]
  vim.cmd [[highlight ModeMsg guifg=#303030]]
  vim.cmd [[highlight CocFloating guifg=#8b90a6 guibg=#202331]]
  vim.cmd [[highlight CocMenuSel guifg=#efefef guibg=#403d59]]
  vim.cmd [[highlight CocPumSearch cterm=bold gui=bold]]

  vim.cmd [[highlight Normal guibg=none]]
  vim.cmd [[highlight NormalFloat guibg=none]]
  vim.cmd [[highlight FloatBorder guibg=none]]
  vim.cmd [[highlight NormalNC guibg=none]]
  vim.cmd [[highlight NonText guibg=none]]
  vim.cmd [[highlight LineNr guibg=none]]
  vim.cmd [[highlight Folded guibg=none]]
  vim.cmd [[highlight EndOfBuffer guibg=none]]
end

if vim.g.isReload then
  vim.schedule(Material_colortheme_customMap)
end

return {
  {
    'marko-cerovac/material.nvim',
    dependencies = { 'folke/lsp-colors.nvim' },
    config = function()
      Material_colortheme_customMap()
    end
  }
}


