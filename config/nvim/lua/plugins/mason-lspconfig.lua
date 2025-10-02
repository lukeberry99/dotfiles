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
  opts = function()
    local servers = require("lsp.servers").servers
    local lspconfig_to_mason = {
      lua_ls = "lua-language-server",
      ts_ls = "typescript-language-server",
      emmet_ls = "emmet-language-server",
      copilot_language_server = "copilot",
    }
    local ensure_installed = {}
    for server_name, _ in pairs(servers) do
      local mason_name = lspconfig_to_mason[server_name] or server_name:gsub("_", "-")
      if mason_name then
        table.insert(ensure_installed, mason_name)
      end
    end
    return {
      automatic_installation = true,
      ensure_installed = ensure_installed,
    }
  end,
}

return {
	mason,
	mason_lspconfig,
}
