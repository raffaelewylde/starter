-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.fn.exists("g:os") == 0 then
  local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
  if is_windows then
    vim.g.os = "Windows"
  else
    local uname_output = vim.fn.system("uname")
    vim.g.os = string.gsub(uname_output, "\n", "")
  end
end
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakat = " ^I!@*-+;:,./?"
vim.opt.showbreak = "++"
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.undofile = true
vim.opt.autowriteall = true
vim.opt.swapfile = false
vim.opt.writebackup = true
vim.opt.fileformats = "unix,dos"
vim.g.CheatSheetDisableFrameworkDetection = 0
if vim.g.os == "Linux" or vim.g.os == "Darwin" then
  vim.env.PATH = vim.env.HOME .. "$HOME/.local/share/mise/shims:" .. vim.env.PATH
  vim.g.ruby_host_prog = "$HOME/.local/share/mise/installs/ruby/3.3.3/bin/neovim-ruby-host"
  vim.g.python3_host_prog = "$HOME/.local/share/mise/installs/python/latest/bin/python3"
  --vim.g.node_host_prog = "$HOME/.local/share/mise/installs/node/20.15.1/bin/node"
  vim.g.node_host_prog = "$HOME/.local/share/mise/installs/node/lts/bin/neovim-node-host"
elseif vim.g.os == "Windows" then
  LazyVim.terminal.setup("pwsh.exe")
  vim.g.python3_host_prog = "%USERPROFILE%\\.pyenv\\pyenv-win\\versions\\3.12.4\\python3.exe"
  vim.g.ruby_host_prog = "%USERPROFILE%\\scoop\\persist\\ruby\\gems\\bin\\neovim-ruby-host"
  vim.g.node_host_prog =
    "%USERPROFILE%\\AppData\\Roaming\\fnm\node-versions\\v20.15.1\\installation\\neovim-node-host.cmd"
end
