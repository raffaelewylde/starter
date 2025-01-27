return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  init = function()
    require("telekasten").setup({
      home = vim.fn.expand("~/Second_Brain/"), -- Put the name of your notes directory here
    })
  end,
}
