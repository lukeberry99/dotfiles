local M = {}

local lspconfig = require("lspconfig")

M.setup = function(opts)
  lspconfig.prismals.setup({})
end

return M
