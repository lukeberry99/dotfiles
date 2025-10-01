local mason = {
	"mason-org/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}

local mason_lspconfig = {
	"mason-org/mason-lspconfig.nvim",
	event = "BufReadPre",
	dependencies = "mason-org/mason.nvim",
  opts = {
    automatic_installation = true,
  },
}

return {
	mason,
	mason_lspconfig,
}
