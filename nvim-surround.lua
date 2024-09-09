return {
  "kylechui/nvim-surround",
  version = "*", -- use for stability; omit this to use 'main' branch for latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- configuration goes here or leave blank for defaults settings.
    })
  end,
}
