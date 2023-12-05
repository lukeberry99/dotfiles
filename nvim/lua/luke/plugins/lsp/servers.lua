local handlers = require("luke.plugins.lsp.handlers")
local lspconfig = require("lspconfig")
local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}

lspconfig.html.setup(opts)
require("luke.plugins.lsp.servers.tsserver").setup(opts)
require("luke.plugins.lsp.servers.jsonls").setup(opts)
require("luke.plugins.lsp.servers.null-ls").setup(opts)
require("luke.plugins.lsp.servers.lua_ls").setup(opts)
require("luke.plugins.lsp.servers.yamlls").setup(opts)
require("luke.plugins.lsp.servers.prismals").setup(opts)
require("luke.plugins.lsp.servers.tailwindcss").setup(opts)
