require'nvim-treesitter.configs'.setup {
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
local timer = vim.loop.new_timer()
timer:start(1000, 0, vim.schedule_wrap(function()
  vim.api.nvim_command('TSUpdate')
end))
