local function key(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts or {})
end

key("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlight" })
key("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
key("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
key("n", "E", vim.diagnostic.open_float, { desc = "Show diagnostic error messages in a floating window" })
key("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic in a quckfix list" })

key("n", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

key("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left split" })
key("n", "<C-l>", "<C-w><C-w>", { desc = "Move focus to right split" })
key("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower split" })
key("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper split" })

-- fzf-lua
key("n", "<leader>sp", function()
	local dirs = { "~/dotfiles/.config/nvim/lua/plugins" }
	require("fzf-lua").live_grep({
		filespec = "-- " .. table.concat(vim.tbl_values(dirs), " "),
		search = "/",
		formatter = "path.filename_first",
	})
end, { desc = "Search Plugin Spec" })
key("n", "<leader>sf", ":FzfLua files<CR>", { desc = "Search files " })
key("n", "<leader>sg", ":FzfLua live_grep<CR>", { desc = "Search Grep" })
key("n", "<leader>sr", ":FzfLua registers<CR>", { desc = "Search registers" })
key("n", "<leader>sb", ":FzfLua buffers<CR>", { desc = "Search buffers" })
key("n", "<leader>gc", ":FzfLua git_bcommits<CR>", { desc = "Search file commits" })
key("n", "<leader>gr", ":FzfLua lsp_references<CR>", { desc = "Search references " })
key("n", "<leader>ds", ":FzfLua lsp_document_signals<CR>", { desc = "Search document signals" })

-- vim-tmux-navigator
key("n", "<c-h>", "<cmd>TmuxNavigateLeft<CR>")
key("n", "<c-j>", "<cmd>TmuxNavigateDown<CR>")
key("n", "<c-k>", "<cmd>TmuxNavigateUp<CR>")
key("n", "<c-l>", "<cmd>TmuxNavigateRight<CR>")
key("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<CR>")
