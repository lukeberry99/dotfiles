local M = {}

local lspconfig = require("lspconfig")

M.setup = function(opts)
  lspconfig.tailwindcss.setup({})
end

return M
