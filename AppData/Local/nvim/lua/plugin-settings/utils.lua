return {
  {
    'nvim-lua/plenary.nvim'
  }, {
    'vim-denops/denops.vim'
  }, {
    'lewis6991/satellite.nvim',
    config = function ()
      require('satellite').setup()
    end
  }, {
    'wakatime/vim-wakatime'
  }, {
    'deris/vim-duzzle'
  }, {
    'rcarriga/nvim-notify'
  }, {
    'dstein64/vim-startuptime'
  }, {
    'Allianaab2m/vimskey',
    requires = { 'vim-denops/denops.vim' }
  }
}
