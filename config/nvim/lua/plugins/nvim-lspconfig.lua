local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs
local typescript_organise_imports = require("util.lsp").typescript_organise_imports

local config = function()
	require("neoconf").setup({})
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local default_config = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  local servers = {
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
      commands = { TypeScriptOrganizeImports = typescript_organise_imports },
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

  for server, opts in pairs(servers) do
    vim.lsp.config[server] = vim.tbl_deep_extend("force", default_config, opts)
  end

  for type, icon in pairs(diagnostic_signs) do
    vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type, numhl = "" })
  end

  vim.lsp.config.efm = {
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

  vim.lsp.enable({
    "gopls", "lua_ls", "jsonls", "pyright", "ts_ls",
    "bashls", "emmet_ls", "dockerls", "clangd", "efm",
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
