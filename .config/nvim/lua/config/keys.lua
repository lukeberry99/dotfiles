local function key(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts or {})
end

key("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlight" } )
key("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" }) 
key("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
key("n", "E", vim.diagnostic.open_float, { desc = "Show diagnostic error messages in a floating window" })
key("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic in a quckfix list" })

key("n", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

key("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left split" })
key("n", "<C-l>", "<C-w><C-w>", { desc = "Move focus to right split" })
key("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower split" })
key("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper split" })

