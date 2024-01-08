return {
	{
		"shaunsingh/oxocarbon.nvim",
		name = "oxocarbon",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme oxocarbon")
		-- end,
		enabled = false,
	},
	{ "ellisonleao/gruvbox.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine-main")
		end,
		enabled = true,
	},
}
