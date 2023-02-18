return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  }, {
    'yioneko/nvim-yati',
    version = '*',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'typescript', 'tsx',
          'diff',
          'dockerfile',
          'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',
          'html', 'json5', 'lua', 'markdown',
          'cpp'
        },
        highlight = { enable = true },
        indent = { enable = false },
        yati = {
          enable = true,
          disable = { 'python' },

          default_lazy = true,

          default_fallback = 'auto'
        }
      }
    end
  }, {
    'AckslD/nvim-anywise-reg.lua'
  }
}
