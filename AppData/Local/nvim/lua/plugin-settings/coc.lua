local modules = {
  {
    'neoclide/coc.nvim',
    branch = 'release'
  }, {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "typescript", "tsx",
          "diff",
          "dockerfile",
          "git_rebase", "gitattributes", "gitcommit", "gitignore",
          "html", "json5", "lua", "markdown",
          "cpp"
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
    dependencies = { 'marko-cerovac/material.nvim' },
    config = function ()
      require('indent_blankline').setup {
        chat_highlight_list = {
          "NonText"
        }
      }
    end
  }, {
    'editorconfig/editorconfig-vim'
  }, {
    'yuki-yano/tsnip.nvim',
    dependencies = { 'vim-denops/denops.vim', 'MunifTanjim/nui.nvim' },
  }
}

vim.api.nvim_set_var(
  'coc_global_extensions',
  {
    'coc-tsnip',
    'coc-css', 'coc-docker', 'coc-emmet', 'coc-eslint', 'coc-html', 'coc-json',
    'coc-lightbulb', 'coc-markdownlint', 'coc-rust-analyzer', 'coc-yaml',
    'coc-tsserver', 'coc-deno', 'coc-discord-rpc', 'coc-lua', 'coc-sumneko-lua',
    'coc-clangd'
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


vim.api.nvim_create_autocmd(
  { 'InsertLeave', 'TextChanged' }, {
    pattern = { '*.ts', '*.tsx' },
    callback = vim.schedule_wrap(function() Eslintfix() end)
  }
)


local eslintRunning = false
local eslintShouldRerun = false
function Eslintfix()
  if eslintRunning then
    eslintShouldRerun = true
    return
  end
  eslintRunning = true
  eslintShouldRerun = false
  require('notify')('ESLint Autofix Running...', 'info', { timeout = 500, render = 'minimal', stages = 'fade' })
  vim.api.nvim_command('CocCommand eslint.executeAutofix')
  vim.loop.new_timer():start(
    1000, 0, vim.schedule_wrap(
      function()
        eslintRunning = false
        if eslintShouldRerun then
          Eslintfix()
        end
      end
    )
  )

end

return modules
