return {
	"stevearc/dressing.nvim",
	enabled = false,
	lazy = true,
	config = function()
		require("dressing").setup({
			input = {
				win_options = {
					winhighlight = "NormalFloat:DiagnosticError",
				},
			},
		})
	end,
}
