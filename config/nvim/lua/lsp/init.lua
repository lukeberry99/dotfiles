local servers = require("lsp.servers")
local keymaps = require("lsp.keymaps")
local diagnostic_signs = require("util.icons").diagnostic_signs

local M = {}

M.setup = function()
  require("neoconf").setup({})
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local default_config = {
    capabilities = capabilities,
    on_attach = keymaps.on_attach,
  }

  for server, opts in pairs(servers.servers) do
    vim.lsp.config[server] = vim.tbl_deep_extend("force", default_config, opts)
  end

  for type, icon in pairs(diagnostic_signs) do
    vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type, numhl = "" })
  end

  vim.lsp.config.efm = vim.tbl_deep_extend("force", default_config, servers.efm)

  local server_names = vim.tbl_keys(servers.servers)
  table.insert(server_names, "efm")
  vim.lsp.enable(servers)
end

return M
