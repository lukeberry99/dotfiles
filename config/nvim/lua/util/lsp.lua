local key = require("util.keymapper").mapvimkey

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	key("fd", "Lspsaga finder", "n", opts) -- go to definition
	key("gd", "Lspsaga peek_definition", "n", opts) -- peak definition
	key("gD", "Lspsaga goto_definition", "n", opts) -- go to definition
	key("gS", "vsplit | Lspsaga goto_definition", "n", opts) -- go to definition
	key("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
	key("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
	key("E", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
	key("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
	key("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
	key("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
	key("<leader>gi", "Lspsaga finder imp", "n", opts) -- implementation

	key("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

	-- Auto-format on save for Go files
	if vim.bo[bufnr].filetype == "go" then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end

	if client.name == "pyright" then
		key("<leader>oi", "PyrightOrganizeImports", "n", opts) -- organise imports
		key("<leader>db", "DapToggleBreakpoint", "n", opts) -- toggle breakpoint
		key("<leader>dr", "DapContinue", "n", opts) -- continue/invoke debugger
		key("<leader>dt", "lua require('dap-python').test_method()", "n", opts) -- run tests
	end

	if client.name == "ts_ls" then
		key("<leader>oi", "TypeScriptOrganizeImports", "n", opts) -- organise imports
	end
end

M.typescript_organise_imports = {
	description = "Organise Imports",
	function()
		local params = {
			command = "_typescript.organizeImports",
			arguments = { vim.fn.expand("%:p") },
		}
		-- reorganise imports
		vim.lsp.buf.execute_command(params)
	end,
}

return M
