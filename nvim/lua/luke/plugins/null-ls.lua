return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "LspAttach" },
  config = function()
    local null_ls = require("null-ls")
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        -- JS/TS
        code_actions.eslint.with({
          prefer_local = "node_modules/.bin",
        }),
        diagnostics.eslint.with({
          prefer_local = "node_modules/.bin",
        }),
        formatting.prettierd.with({
          prefer_local = "node_modules/.bin",
        }),
        -- Python
        formatting.black,
        -- Lua
        formatting.stylua,
      },
    })
  end,
}
