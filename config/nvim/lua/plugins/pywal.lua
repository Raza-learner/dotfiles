return {
  {
    "AlphaTechnolog/pywal.nvim",
    name = "pywal",
    lazy = false,      -- load immediately
    priority = 1000,   -- load before other themes
    config = function()
      vim.cmd("colorscheme pywal")
    end,
  },
}
