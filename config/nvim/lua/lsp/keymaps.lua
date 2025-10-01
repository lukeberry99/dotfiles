local M = {}

M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "fd", "<cmd>Lspsaga finder<CR>", opts)
  vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
  vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
  vim.keymap.set("n", "gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", opts)
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  vim.keymap.set("n", "E", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  vim.keymap.set("n", "<leader>gi", "<cmd>Lspsaga finder imp<CR>", opts)
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

  if vim.bo[bufnr].filetype == "go" then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end

  if client.name == "pyright" then
    vim.keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
    vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
    vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", opts)
    vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dap-python').test_method()<CR>", opts)
  end

  if client.name == "gopls" then
    vim.keymap.set("n", "<leader>oi", "<cmd>lua vim.lsp.buf.code_action({context = {only = {'source.organizeImports'}}, apply = true})<CR>", opts)
    vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
    vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", opts)
    vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>", opts)
  end

  if client.name == "ts_ls" then
    vim.keymap.set("n", "<leader>oi", "<cmd>TypeScriptOrganizeImports<CR>", opts)
  end
end

return M
