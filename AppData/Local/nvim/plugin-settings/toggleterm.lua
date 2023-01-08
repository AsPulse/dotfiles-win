local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

local Terminal = require("toggleterm.terminal").Terminal


function _lazygit_toggle()
  Terminal:new({
    cmd = "lazygit",
    dir = vim.fn.getcwd(),
    direction = "float",
    hidden = true,
    count = 1
  }):toggle()
end


function _toggleterm_cd()
  require'toggleterm'.exec("cd "..vim.fn.getcwd(), 2)
end

vim.api.nvim_set_keymap("n", "git", "<cmd>lua _lazygit_toggle()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<esc><esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.api.nvim_create_user_command('TermReCwd', "lua _toggleterm_cd()", {})
