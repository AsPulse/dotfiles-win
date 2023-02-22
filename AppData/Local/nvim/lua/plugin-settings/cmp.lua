return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'BufEnter *.*', 'CmdlineEnter' },
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' },
      { 'onsails/lspkind.nvim' },
      { 'hrsh7th/vim-vsnip' },
      {
        'kento-ogata/cmp-tsnip',
        dependencies = {
          'yuki-yano/tsnip.nvim'
        }
      },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
    },
    config = function()
      local cmp = require('cmp')
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
          completion = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpFloating,FloatBorder:None,Search:None',
            col_offset = -3
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpFloating,FloatBorder:None,Search:None',
          }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'tsnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format({
              mode = 'symbol_text',
              menu = {
                tsnip = 'Snippet'
              },
              maxwidth = 50,
            })(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            if entry.source.name == 'tsnip' then
              kind.kind = ''
              kind.menu = 'Snippet'
              kind.kind_hl_group = 'CmpItemKindSnippet'
            else
              kind.kind = (strings[1] or '')
              kind.menu = (strings[2] or '')
            end
            kind.menu = '  (' .. kind.menu .. ')'
            return kind
          end,
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          }
        })
      })
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          local setupfunc = lspconfig[server_name]
          if server_name == 'tsserver' then
            setupfunc.setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern('yarn.lock'),
              single_file_support = false,
            })
            return
          end
          if server_name == 'denols' then
            setupfunc.setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
              single_file_support = false,
              init_options = {
                lint = true,
                unstable = true
              }
            })
            return
          end
          if server_name == 'lua_ls' then
            setupfunc.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' }
                  }
                }
              }
            })
            return
          end
          setupfunc.setup({ capabilities = capabilities })
        end
      })
    end
  }
}

