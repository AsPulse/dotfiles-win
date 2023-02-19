return {
  { 'neovim/nvim-lspconfig' },
  {
    'williamboman/mason.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      require('mason-lspconfig').setup({
        ensure_installed = {
          'tsserver',
          'eslint',
          'lua_ls',
          'denols',
          'clangd'
        },
        automatic_installation = true,
      })
    end
  },
  { 'onsails/lspkind.nvim' },
  { 'hrsh7th/vim-vsnip' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-buffer' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'onsails/lspkind.nvim',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      cmp.setup({
        enabled = true,
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body);
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
          })
        }
      })
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          local opts = {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
          }
          require('lspconfig')[server_name].setup(opts)
        end
      })
    end
  },
}

