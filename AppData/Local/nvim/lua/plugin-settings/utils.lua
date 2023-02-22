return {
  { 'nvim-lua/plenary.nvim' },
  { 'vim-denops/denops.vim' },
  { 'editorconfig/editorconfig-vim' },
  { 'MunifTanjim/nui.nvim' },
  { 'wakatime/vim-wakatime' },
  { 'deris/vim-duzzle' },
  { 'dstein64/vim-startuptime' },
  { 'kkharji/sqlite.lua' },
  {
    'Allianaab2m/vimskey',
    dependencies = { 'vim-denops/denops.vim' }
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        background_colour = '#1E1E2E'
      }
    end
  },
  {
    'lewis6991/satellite.nvim',
    config = function ()
      require('satellite').setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup {
        signcolumn = false,
        numhl = true
      }
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = { 'marko-cerovac/material.nvim' },
    config = function ()
      require('indent_blankline') .setup {
        chat_highlight_list = { 'NonText' }
      }
    end
  },
  {
    'petertriho/nvim-scrollbar',
    config = function ()
      require('scrollbar').setup()
    end
  },
  {
    'tyru/capture.vim'
  },
  {
    'jghauser/mkdir.nvim'
  }
}
