return {
	{ "tpope/vim-sensible" }, -- Sensible defaults
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{
		"ibhagwan/fzf-lua",
		keys = {
			{ 
				"<leader>sp",
				function()
					local dirs = { "~/dotfiles/.config/nvim/lua/plugins"  }
					require("fzf-lua").live_grep({
						filespec = "-- " .. table.concat(vim.tbl_values(dirs), " "),
						search = "/",
						formatter = "path.filename_first",
					})
				end,
				desc = "Search Plugin Spec",
			},
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim"
		},
		opts = {
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
			},
		},
	},
}
