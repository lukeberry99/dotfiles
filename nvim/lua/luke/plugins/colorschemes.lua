return {
	{ "shaunsingh/oxocarbon.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- high prio because we want it quiiiiiick
		config = function()
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
}
