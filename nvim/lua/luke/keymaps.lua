local keymap = vim.keymap.set

-- Clear search highlight
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
keymap("n", "<leader>h", "<cmd>nohl<CR>", { desc = "No HL Search" })

-- Ex mode sucks
keymap("n", "Q", "<Nop>", { silent = true })

keymap("n", "<Leader>bd", "<cmd>bd<CR>", { desc = "" })

-- LSP mappings
keymap("n", "K", function()
	vim.lsp.buf.hover()
end, { desc = "Hover" })
keymap("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to definition" })
keymap("n", "gi", function()
	vim.lsp.buf.implementation()
end, { desc = "Go to implementation" })
keymap("n", "gf", function()
	vim.lsp.buf.references()
end, { desc = "Go to references" })
keymap("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })
keymap("n", "gs", function()
	vim.lsp.buf.signature_help()
end, { desc = "Show signature help" })
keymap("n", "gt", function()
	vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })
keymap("n", "ga", function()
	vim.lsp.buf.code_action()
end, { desc = "Show code actions" })
keymap("n", "E", function()
	vim.diagnostic.open_float()
end, { desc = "Show error diagnostics" })
keymap("n", "[d", function()
	vim.diagnostic.goto_prev()
end, { desc = "Go to previous error" })
keymap("n", "]d", function()
	vim.diagnostic.goto_next()
end, { desc = "Go to next error" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File navigation" })
-- WhichKey (leader) mappings
local which_key_status, which_key = pcall(require, "which-key")
if which_key_status then
	-- Normal mode mappings
	which_key.register({
		f = {
			name = "Find",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
			l = { "<cmd>Telescope resume<cr>", "Resume last search" },
			c = { "<cmd>Telescope colorscheme<cr>", "Pick colorscheme" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
			u = {
				function()
					vim.cmd("UndotreeToggle")
					-- If closing, won't do anything.
					vim.cmd("UndotreeFocus")
				end,
				"Undo tree",
			},
		},
		r = {
			name = "LSP",
			R = {
				"<CMD>LspRestart<CR>",
				"Restart",
			},
			s = {
				"<CMD>LspStop<CR>",
				"Stop",
			},
			S = {
				"<CMD>LspStart<CR>",
				"Start",
			},
			r = {
				function()
					vim.lsp.buf.rename()
				end,
				"Rename",
			},
			a = {
				function()
					vim.lsp.buf.code_action()
				end,
				"Code actions",
			},
			f = {
				function()
					vim.lsp.buf.format()
				end,
				"Formatting",
			},
		},
		g = {
			name = "Git",
			p = { "<cmd>lua require('gitsigns').prev_hunk<CR>", "Previous Hunk" },
			n = { "<cmd>lua require('gitsigns').next_hunk<CR>", "Next Hunk" },
			P = { "<cmd>lua require('gitsigns').preview_hunk<CR>", "Preview Hunk" },
		},
		d = {
			name = "Diagnostics",
			d = { "<cmd>TroubleToggle<cr>", "All diagnostics" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
			D = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
			l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
			r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
		},
		p = {
			name = "Plugins",
			l = { "<cmd>Lazy<cr>", "Lazy" },
			m = { "<cmd>Mason<cr>", "Mason" },
		},
		["/"] = {
			{ "<Plug>(comment_toggle_linewise_current)", "Comment" },
		},
	}, { prefix = "<leader>" })

	-- Visual mode mappings
	which_key.register({
		["/"] = {
			{ "<Plug>(comment_toggle_linewise_visual)", "Comment" },
		},
	}, {
		prefix = "<leader>",
		mode = "v",
	})
end
