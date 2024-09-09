-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o = vim.o
local fn = vim.fn
local g = vim.g
if fn.exists("g:os") == 0 then
  local is_windows = fn.has("win64") == 1 or fn.has("win32") == 1 or fn.has("win16") == 1
  if is_windows then
    g.os = "Windows"
  else
    local uname_output = fn.system("uname")
    g.os = string.gsub(uname_output, "\n", "")
  end
end
vim.loader.enable()
o.wrap = true
o.linebreak = true
o.breakindent = true
o.fsync = false
o.breakat = " ^I!@*-+;:,./?"
o.showbreak = "++"
o.tabstop = 8
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.undofile = true
o.autowriteall = true
o.swapfile = false
o.writebackup = true
o.fileformats = "unix,dos"
g.CheatSheetDisableFrameworkDetection = 0
if g.os == "Linux" or g.os == "Darwin" then
  vim.env.PATH = vim.env.HOME .. "$HOME/.local/share/mise/shims:" .. vim.env.PATH
  vim.g.ruby_host_prog = "$HOME/.local/share/mise/installs/ruby/latest/bin/neovim-ruby-host"
  vim.g.python3_host_prog = "${HOME}/.venvs/neovim/bin/python3"
  vim.g.node_host_prog = "$HOME/.local/share/mise/installs/node/latest/bin/neovim-node-host"
elseif vim.g.os == "Windows" then
  LazyVim.terminal.setup("pwsh.exe")
  g.python3_host_prog = "%USERPROFILE%\\.pyenv\\pyenv-win\\versions\\3.12.4\\python3.exe"
  g.ruby_host_prog = "%USERPROFILE%\\scoop\\persist\\ruby\\gems\\bin\\neovim-ruby-host"
  g.node_host_prog = "%USERPROFILE%\\AppData\\Roaming\\fnm\\node-versions\\v20.15.1\\installation\\neovim-node-host.cmd"
  vim.cmd([[
    let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \       '+': 'clip.exe',
            \       '*': 'clip.exe',
            \   },
            \   'paste': {
            \       '+': 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \       '*': 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \   },
            \   'cache_enabled': 0,
            \ }
  ]])
end
if g.neovide then
  if g.os == "Linux" then
    o.guifont = "MesloLGS_Nerd_Font,Hack_Nerd_Font,Noto_Color_Emoji:h14"
  end
  g.neovide_text_gamma = 0.8
  g.neovide_text_contrast = 0.1
  if g.os == "Darwin" then
    -- Helper function for transparency formatting
    local alpha = function()
      return string.format("%x", math.floor(255 * g.transparency or 0.8))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    g.neovide_transparency = 0.0
    g.transparency = 0.8
    g.neovide_background_color = "#ee55ee" .. alpha()
    g.neovide_window_blurred = true
    g.neovide_show_border = true
    g.neovide_input_macos_option_key_is_meta = "only_left"
    o.guifont = "MesloLGS_NF,Hack_Nerd_Font,JetBrainsMono_Nerd_Font:h14"
  end
  if g.os == "Linux" then
    g.neovide_transparency = 0.8
  end
  g.neovide_position_animation_length = 0.15
  g.neovide_scroll_animation_length = 0.3
  g.neovide_scroll_animation_far_lines = 9999
  g.neovide_remember_window_size = true
  g.neovide_cursor_animation_length = 0.13
  g.neovide_cursor_trail_size = 0.8
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_animate_in_insert_mode = true
  g.neovide_cursor_animate_command_line = true
  g.neovide_cursor_unfocused_outline_width = 0.125
  g.neovide_cursor_vfx_mode = "railgun"
  g.neovide_cursor_vfx_particle_lifetime = 1.2
  g.neovide_cursor_vfx_particle_density = 7.0
  g.neovide_cursor_vfx_particle_speed = 10.0
  g.neovide_cursor_vfx_particle_phase = 8.5
  g.neovide_cursor_vfx_particle_curl = 0.4
end
