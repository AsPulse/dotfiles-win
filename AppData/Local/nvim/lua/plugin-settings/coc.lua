local modules = {
  {
    'neoclide/coc.nvim',
    branch = 'release'
  }, {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "typescript", "tsx",
          "diff",
          "dockerfile",
          "git_rebase", "gitattributes", "gitcommit", "gitignore",
          "html", "json5", "lua", "markdown",
          "markdown",
        },
        highlight = { enable = true },
        indent = { enable = true }
      }
    end
  }, {
    'lewis6991/gitsigns.nvim' ,
    config = function()
      require('gitsigns').setup {
        signcolumn = false,
        numhl = true
      }
    end
  }, {
    'lukas-reineke/indent-blankline.nvim',
    requires = { 'marko-cerovac/material.nvim' },
    config = function ()
      require('indent_blankline').setup {
        chat_highlight_list = {
          "NonText"
        }
      }
    end
  }, {
    'gpanders/editorconfig.nvim'
  }
}

vim.api.nvim_set_var(
  'coc_global_extensions',
  {
    'coc-css', 'coc-docker', 'coc-emmet', 'coc-eslint', 'coc-html', 'coc-json',
    'coc-lightbulb', 'coc-markdownlint', 'coc-rust-analyzer', 'coc-yaml',
    'coc-tsserver', 'coc-discord-rpc', 'coc-lua', 'coc-sumneko-lua'
  }
)

local remap = { expr = false, remap = true, silent = true }
local noremap = { expr = false, remap = false, silent = true }
local expr = { expr = true, remap = false, silent = true }

vim.keymap.set('i', '<C-Space>', 'coc#refresh()', expr)
vim.keymap.set('i', '<Tab>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<Tab>"', expr)
vim.keymap.set('n', 'K', '<cmd>call CocActionAsync("doHover")<cr>', noremap)

vim.keymap.set('n', '<F2>', '<Plug>(coc-rename)', remap)
vim.keymap.set('n', '<C-k>', '<Plug>(coc-codeaction-cursor)', remap)
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', remap)
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', remap)
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', remap)
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', remap)

return modules
