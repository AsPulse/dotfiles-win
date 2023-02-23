return {
  {
    'wakatime/vim-wakatime',
    event = 'VeryLazy'
  },
  {
    'Allianaab2m/vimskey',
    event = 'VeryLazy',
    dependencies = { 'vim-denops/denops.vim' }
  },
  {
    'vbe0201/vimdiscord',
    event = 'VeryLazy',
  },
  {
    'jbyuki/instant.nvim',
    event = 'VeryLazy',
    config = function()
      vim.g.instant_username = 'AsPulse'
    end
  }
}
