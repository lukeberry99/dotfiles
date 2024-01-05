return {
	{
		"shaunsingh/oxocarbon.nvim",
		name = "oxocarbon",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme oxocarbon")
		end,
	},
	{ "ellisonleao/gruvbox.nvim", enabled = false },
	{ "rebelot/kanagawa.nvim", enabled = false },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- priority = 1000, -- high prio because we want it quiiiiiick
		-- config = function()
		-- 	vim.cmd("colorscheme rose-pine-moon")
		-- end,
		enabled = false,
	},
}
