local key = require("util.keymapper").mapvimkey

-- Buffer navigation
key("<leader>bn", ":bnext<CR>", "n") -- Next buffer
key("<leader>bp", ":bprevious<CR>", "n") -- Previous buffer
key("<leader>bd", ":bdelete<CR>", "n") -- Delete buffer

-- FZF-LUA
key("<leader>sf", "FzfLua files", "n") -- Find files
key("<leader>sg", "FzfLua live_grep", "n") -- Grep across entire project 
key("<leader>fc", "FzfLua git_bcommits", "n") -- Search commits
key("<leader><leader>", "FzfLua buffers", "n") -- Find open buffers

-- Y to EOL
vim.keymap.set("n", "Y", "y$") -- Yank to EOL

-- Center screen when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Half page down (centered)
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Half page up (centered)

-- Splitting & Resizing
key("<leader>sv", ":vsplit<CR>", "n") -- Split window vertically
key("<leader>sh", ":split<CR>", "n") -- Split window horizontally
key("<C-Up>", ":resize +2<CR>", "n") -- Increase window height
key("<C-Down>", ":resize -2<CR>", "n") -- Decrease window height
key("<C-Right>", ":vertical resize +2<CR>", "n") -- Increase window width
key("<C-Left>", ":vertical resize -2<CR>", "n") -- Decrease window width

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h") -- Move to left window 
vim.keymap.set("n", "<C-j>", "<C-w>j") -- Move to bottom window 
vim.keymap.set("n", "<C-k>", "<C-w>k") -- Move to top window 
vim.keymap.set("n", "<C-l>", "<C-w>l") -- Move to right window 

-- Quit window
local function smart_quit()
  if vim.fn.winnr('$') > 1 then
    vim.cmd('q')
  elseif #vim.fn.getbufinfo({buflisted=1}) > 1 then
    vim.cmd('bdelete')
  else
    vim.cmd('enew')
    vim.cmd('bdelete #')
  end
end

vim.keymap.set("n", "q", smart_quit)

-- Better line indenting in visual mode
vim.keymap.set("n", "<", "<gv") -- Indent left and reselect
vim.keymap.set("n", ">", ">gv") -- Indent right and reselect

-- Quick file navigation
key("<leader>e", ":Oil<CR>", "n") -- Open file explorer

-- Vim fugitive
key("<leader>gg", "Git", "n")
key("<leader>gb", "G blame", "n")

-- Copy full file-path
vim.keymap.set("n", "<leader>pa", function() 
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end)

-- Terminal
vim.keymap.set("n", "<leader>t", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
vim.keymap.set("n", "<leader>lg", FloatingLazygit, { noremap = true, silent = true, desc = "Toggle floating lazygit" })
vim.keymap.set("n", "<leader>ht", FloatingHtop, { noremap = true, silent = true, desc = "Toggle floating htop" })

-- Close any floating terminal from terminal mode
vim.keymap.set("t", "<Esc>", function()
  for _, state in pairs(terminal_instances) do
    if state.is_open and vim.api.nvim_win_is_valid(state.win) then
      vim.api.nvim_win_close(state.win, false)
      state.is_open = false
      break
    end
  end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })
