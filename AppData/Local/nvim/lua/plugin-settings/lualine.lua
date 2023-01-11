local modules = {
  {
    'nvim-lualine/lualine.nvim',
    config = function ()
      require('lualine').setup {
        options = {
          theme = 'material-nvim'
        }
      }
    end
  }
}


return modules
