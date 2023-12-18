return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		-- Allows to define text objects based on treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- Allows to define which comments to use dinamically (make sure to set the comment plugin integration!)
		"JoosepAlviste/nvim-ts-context-commentstring",
		-- Auto close/rename html tags
		"windwp/nvim-ts-autotag",
	},
	config = function() 
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {"markdown_inline", "regex"},
			auto_install = true,
			matchup = {
				enable = false
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = { "bash" },
			},
			indent = { enable = false },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<M-space>",
				},
			},
			autotag = {
				enable = true,
			},
		})
	end
}
