return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations" },
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				adaptive_size = true,
				side = "right",
			},
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			select_prompts = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				show_on_open_dirs = true,
			},
			actions = {
				change_dir = {
					enable = true,
					global = true,
				},
				open_file = {
					quit_on_open = true,
				},
			},
			git = {
				-- Disable ignoring files
				ignore = false,
			},
		})
		require("lsp-file-operations").setup()
	end,
}
