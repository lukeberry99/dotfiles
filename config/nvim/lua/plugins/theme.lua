return {
  {
    "rose-pine/neovim",
    name = "rose-pine-moon",
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true
        }
      })
      vim.cmd("colorscheme rose-pine-moon")
    end
  },
}
