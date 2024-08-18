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
  vim.g.python3_host_prog = "${HOME}/.local/share/mise/shims/python3"
  -- vim.g.python3_host_prog = "$HOME/.local/share/mise/installs/python/latest/bin/python3"
  -- vim.g.node_host_prog = "$HOME/.local/share/mise/installs/node/20.15.1/bin/node"
  vim.g.node_host_prog = "$HOME/.local/share/mise/installs/node/lts/bin/neovim-node-host"
elseif vim.g.os == "Windows" then
  LazyVim.terminal.setup("pwsh.exe")
  vim.g.python3_host_prog = "%USERPROFILE%\\.pyenv\\pyenv-win\\versions\\3.12.4\\python3.exe"
  vim.g.ruby_host_prog = "%USERPROFILE%\\scoop\\persist\\ruby\\gems\\bin\\neovim-ruby-host"
  vim.g.node_host_prog =
    "%USERPROFILE%\\AppData\\Roaming\\fnm\\node-versions\\v20.15.1\\installation\\neovim-node-host.cmd"
end
if vim.g.neovide then
  vim.o.guifont = "MesloLGS_Nerd_Font,Hack_Nerd_Font,Noto_Color_Emoji:h14"
  vim.g.neovide_text_gamma = 0.8
  vim.g.neovide_text_contrast = 0.1
  if vim.g.os == "Darwin" then
    -- Helper function for transparency formatting
    local alpha = function()
      return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_transparency = 0.0
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#ee55ee" .. alpha()
    vim.g.neovide_window_blurred = true
    vim.g.neovide_show_border = true
    vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  end
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_position_animation_length = 0.15
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_scroll_animation_far_lines = 9999
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  vim.g.neovide_cursor_vfx_particle_phase = 8.5
  vim.g.neovide_cursor_vfx_particle_curl = 0.4
end
