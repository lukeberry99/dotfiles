return {
	{
		"kepano/flexoki-neovim",
		name = "flexoki",
		lazy = false,
		priority = 1000,
	},
	{
		"gambhirsharma/vesper.nvim",
		lazy = false,
		priority = 1000,
		name = "vesper",
	},
	{
		"shaunsingh/oxocarbon.nvim",
		name = "oxocarbon",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme oxocarbon]])
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "rebelot/kanagawa.nvim" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			local rose = require("rose-pine")

			rose.setup({
				dim_inactive_windows = false,
				styles = {
					transparency = true,
				},
			})

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
