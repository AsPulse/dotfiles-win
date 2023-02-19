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
          -- 'denols',
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
      local lspconfig = require('lspconfig')
      cmp.setup({
        enabled = true,
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body);
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end, { 'i', 's' }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          local setupfunc = lspconfig[server_name]
          if server_name == 'tsserver' or server_name == 'eslint' then
            setupfunc.setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern('yarn.lock'),
              single_file_support = false,
            })
          elseif server_name == 'denols' then
            setupfunc.setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
              single_file_support = false,
              init_options = {
                lint = true,
                unstable = true
              }
            })
          else
            setupfunc.setup({ capabilities = capabilities })
          end
        end
      })
    end
  },
  {
    'kkharji/lspsaga.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function ()
      require('lspsaga').setup({})
      vim.keymap.set('n', 'lrn', function() vim.api.nvim_command('Lspsaga rename') end, {})
      vim.keymap.set('n', 'lac', function() vim.api.nvim_command('Lspsaga code_action') end, {})
      vim.keymap.set('n', 'K', function() vim.api.nvim_command('Lspsaga hover_doc') end, {})
    end
  },
  {
    'stevearc/dressing.nvim',
    config = function ()
      require('dressing').setup()
    end
  },
  {
    'j-hui/fidget.nvim',
    config = function ()
      require('fidget').setup{}
    end
  },
  { 'folke/lsp-colors.nvim' }
}
