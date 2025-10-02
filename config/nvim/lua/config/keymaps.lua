-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

-- FZF-LUA
vim.keymap.set("n", "<leader>sf", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader>sg", "<cmd>FzfLua live_grep<CR>")
vim.keymap.set("n", "<leader>fc", "<cmd>FzfLua git_bcommits<CR>")
vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua buffers<CR>")

vim.keymap.set("n", "<leader>rr", ":e! %<CR>")

-- Y to EOL
vim.keymap.set("n", "Y", "y$")

-- Center screen when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- -- Quit window
-- local function smart_quit()
--   if vim.fn.winnr('$') > 1 then
--     vim.cmd('q')
--   elseif #vim.fn.getbufinfo({buflisted=1}) > 1 then
--     vim.cmd('bdelete')
--   else
--     vim.cmd('enew')
--     vim.cmd('bdelete #')
--   end
-- end
--
-- vim.keymap.set("n", "q", smart_quit)

-- Better line indenting in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Quick file navigation
vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end)

-- Vim fugitive
vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>G blame<CR>")

-- Copy full file-path
vim.keymap.set("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end)

-- Terminal
vim.keymap.set("n", "<leader>t", FloatingTerminal, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lg", FloatingLazygit, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ht", FloatingHtop, { noremap = true, silent = true })

vim.keymap.set("t", "<Esc>", function()
  for _, state in pairs(terminal_instances) do
    if state.is_open and vim.api.nvim_win_is_valid(state.win) then
      vim.api.nvim_win_close(state.win, false)
      state.is_open = false
      break
    end
  end
end, { noremap = true, silent = true })
