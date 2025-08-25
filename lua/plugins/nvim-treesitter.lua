return {
  "nvim-treesitter/nvim-treesitter",
  config = function(_, opts)
    -- 👇 tell Treesitter to use clang
    require("nvim-treesitter.install").compilers = { "clang" }

    -- pass opts into treesitter
    require("nvim-treesitter.configs").setup(opts)
  end,
}