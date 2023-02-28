return {
  {
    'wakatime/vim-wakatime',
    enabled = false,
    event = 'VeryLazy'
  },
  {
    'Allianaab2m/vimskey',
    event = 'VeryLazy',
    enabled = false,
    dependencies = { 'vim-denops/denops.vim' }
  },
  {
    'andweeb/presence.nvim',
    enabled = false,
    event = 'VeryLazy',
  },
  {
    'jbyuki/instant.nvim',
    event = 'VeryLazy',
    enabled = false,
    config = function()
      vim.g.instant_username = 'AsPulse'
    end
  }
}
