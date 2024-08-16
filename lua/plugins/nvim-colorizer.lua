return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", -- highlight all files
      css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
    })
  end,
}
