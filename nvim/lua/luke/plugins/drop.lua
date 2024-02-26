return {
	"folke/drop.nvim",
	event = "VimEnter",
	config = function()
		require("drop").setup({
			theme = "stars",
			max = 40,
			interval = 150,
			screensaver = 1000 * 60 * 5,
			filetypes = { "dashboard", "alpha", "starter" },
		})
	end,
}
