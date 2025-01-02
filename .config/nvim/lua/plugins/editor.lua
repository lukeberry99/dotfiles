return {
	{ "tpope/vim-sensible" },
	{ "tpope/vim-sleuth" },
	{ "ibhagwan/fzf-lua" },
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		version = "v0.*",

		opts = {
			keymap = { preset = "default" },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},
}
