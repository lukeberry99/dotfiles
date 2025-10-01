local M = {}

M.typescript_organise_imports = {
  description = "Organise Imports",
  function()
    local params = {
      command = "_typescript.organizeImports",
      arguments = { vim.fn.expand("%:p") },
    }
    vim.lsp.buf.execute_command(params)
  end,
}

M.servers = {
  gopls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
          },
        },
      },
    },
  },
  jsonls = {
    filetypes = { "json", "jsonc" },
  },
  ts_ls = {
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    commands = { TypeScriptOrganizeImports = M.typescript_organise_imports },
    settings = {
      typescript = {
        indentStyle = "space",
        indentSize = 2,
      },
    },
  },
  bashls = {
    filetypes = { "sh", "aliasrc" },
  },
  emmet_ls = {
    filetypes = {
      "typescriptreact",
      "javascriptreact",
      "javascript",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
      "vue",
      "html",
    },
  },
  dockerls = {},
  clangd = {
    cmd = { "clangd", "--offset-encoding=utf-16" },
  },
}

M.efm = {
  filetypes = {
    "lua", "python", "json", "jsonc", "sh", "javascript", "javascriptreact",
    "typescript", "typescriptreact", "svelte", "vue", "markdown", "docker",
    "html", "css", "c", "cpp", "go",
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
  },
  settings = {
    languages = {
      lua = { require('efmls-configs.linters.luacheck'), require('efmls-configs.formatters.stylua') },
      python = { require('efmls-configs.linters.flake8'), require('efmls-configs.formatters.black') },
      json = { require('efmls-configs.linters.eslint'), require('efmls-configs.formatters.fixjson') },
      jsonc = { require('efmls-configs.linters.eslint'), require('efmls-configs.formatters.fixjson') },
      sh = { require('efmls-configs.linters.shellcheck'), require('efmls-configs.formatters.shfmt') },
      javascript = { require("efmls-configs.linters.eslint"), require("efmls-configs.formatters.prettier_d") },
      javascriptreact = { require("efmls-configs.linters.eslint"), require("efmls-configs.formatters.prettier_d") },
      typescript = { require("efmls-configs.linters.eslint"), require("efmls-configs.formatters.prettier_d") },
      typescriptreact = { require("efmls-configs.linters.eslint"), require("efmls-configs.formatters.prettier_d") },
      svelte = { require("efmls-configs.linters.eslint"), require("efmls-configs.formatters.prettier_d") },
      vue = { require("efmls-configs.linters.eslint"), require("efmls-configs.formatters.prettier_d") },
      markdown = { require("efmls-configs.formatters.prettier_d") },
      docker = { require("efmls-configs.linters.hadolint"), require("efmls-configs.formatters.prettier_d") },
      html = { require("efmls-configs.formatters.prettier_d") },
      css = { require("efmls-configs.formatters.prettier_d") },
      c = { require("efmls-configs.formatters.clang_format"), require("efmls-configs.linters.cpplint") },
      cpp = { require("efmls-configs.formatters.clang_format"), require("efmls-configs.linters.cpplint") },
      go = { require("efmls-configs.formatters.gofumpt"), require("efmls-configs.linters.go_revive") },
    },
  },
}

return M
