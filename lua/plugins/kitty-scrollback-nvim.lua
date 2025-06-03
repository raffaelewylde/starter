local kitty_scrollback_config = function()
  require("kitty-scrollback").setup({
    -- global config
    {
      visual_selection_highlight_mode = "reverse",
      callbacks = {
        after_ready = function()
          vim.defer_fn(function()
            vim.notify("\nThis is a global config", vim.log.levels.WARN, {})
          end, 1000)
        end,
      },
    },
    search = {
      callbacks = {
        after_ready = function()
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("?", "n", false)
          end, 100)
        end,
      },
    },
  })
end

if vim.env.KITTY_SCROLLBACK_NVIM == "true" then
  -- kitty-scrollback.nvim minimal config
  vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/lazy/kitty-scrollback.nvim") -- lazy.nvim
  vim.g.mapleader = " "
  vim.g.maplocalleader = ","
  vim.cmd.colorscheme("elflord")
  kitty_scrollback_config()
  return {}
else
  -- kitty-scrollback.nvim lazy.nvim config
  return {
    {
      "mikesmithgh/kitty-scrollback.nvim",
      enabled = true,
      lazy = true,
      cmd = {
        "KittyScrollbackGenerateKittens",
        "KittyScrollbackCheckHealth",
        "KittyScrollbackGenerateCommandLineEditing",
      },
      event = { "User KittyScrollbackLaunch" },
      config = kitty_scrollback_config,
    },
  }
end
