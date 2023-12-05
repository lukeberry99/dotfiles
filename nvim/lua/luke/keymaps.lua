local util = require("luke.utils")
local keymap = vim.keymap.set

-- Basic
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
keymap({ "n" }, "<CR>", "viw", { desc = "Select word under cursor" })

-- save and quit
keymap("n", "<leader><Tab>d", ":tabclose<CR>", { silent = true, desc = "Close Tab" })
keymap("n", "<leader><Tab>n", ":tabnext<CR>", { silent = true, desc = "Next Tab" })
keymap("n", "<leader><Tab>p", ":tabprevious<CR>", { silent = true, desc = "Previous Tab" })

keymap("n", "x", '"_x', { silent = true })
keymap("n", "Y", "y$", { silent = true })
keymap("n", "n", "nzzzv", { silent = true })
keymap("n", "N", "Nzzzv", { silent = true })
keymap("n", "gj", "mzJ`z", { silent = true, desc = "Join Line Below" })
keymap("v", "<", "<gv", { silent = true, desc = "Indent Less" })
keymap("v", ">", ">gv", { silent = true, desc = "Indent More" })
keymap("n", "<C-e>", "<Nop>", { silent = true, desc = "Scroll screen down" })
keymap("n", "<C-y>", "3<C-y>", { silent = true, desc = "Scroll screen up" })

-- disable Ex mode, I always enter in it by mistake
keymap("n", "Q", "<Nop>", { silent = true })

-- Alternate file
keymap("n", "<leader><leader>", "<C-^>", { silent = true, desc = "Last Buffer" })

keymap("n", "<leader>bn", "<cmd>enew<cr>", { silent = true, desc = "New File" })

-- Telescope
keymap("n", "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" })
keymap(
  "n",
  "<leader>fg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { silent = true, desc = "Live Grep" }
)
keymap(
  "n",
  "<leader>fG",
  ":lua require('luke.plugins.telescope').grep_current_dir()<CR>",
  { silent = true, desc = "Live Grep Current Dir" }
)
keymap(
  "n",
  "<leader>fb",
  ":lua require('luke.plugins.telescope').buffers()<CR>",
  { silent = true, desc = "Open Buffers" }
)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { silent = true, desc = "Help Tags" })
keymap("n", "<leader>fH", "<cmd>Telescope highlights<CR>", { silent = true, desc = "Highlights" })
keymap("n", "<leader>fr", "<cmd>Telescope resume<cr>", { silent = true, desc = "Resume" })
keymap("n", "<leader>fp", "<cmd>Telescope pickers<cr>", { silent = true, desc = "Pickers" })
keymap("n", "<leader>fs", ":lua require('telescope.builtin').git_status()<CR>", { silent = true, desc = "Git Status" })
keymap("n", "<leader>ff", function()
  local themes = require("telescope.themes")
  local theme = themes.get_dropdown()
  require("telescope.builtin").lsp_document_symbols({
    layout_config = theme.layout_config,
    previewer = false,
    results_title = false,
    symbols = { "function" },
  })
end, { silent = true, desc = "Functions In File" })
keymap(
  "n",
  "<leader>fB",
  ":lua require('telescope.builtin').git_branches()<CR>",
  { silent = true, desc = "Git Branches" }
)
keymap(
  "n",
  "<C-p>",
  function()
    require("telescope").extensions.smart_open.smart_open({
      cwd_only = true,
      preview = { hide_on_startup = true },
      layout_config = {
        width = 0.65,
        height = 0.35,
      },
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
        },
      },
      open_buffer_indicators = {
        previous = "󱪓",
        others = "󰘓",
      },
    })
  end,
  { silent = true, desc = "Project Files" }
)
keymap("n", "<leader>fi", "<cmd>Telescope import<cr>", { silent = true, desc = "Imports" })
keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", { silent = true, desc = "Commands" })

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle File Tree" })

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, desc = "Toggle Trouble" })
keymap(
  "n",
  "<leader>xw",
  "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  { silent = true, desc = "Workspace Diagnostics" }
)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, desc = "Document Diagnostics" })
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, desc = "Loclist" })
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, desc = "Quickfix" })
keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", { silent = true, desc = "LSP References" })

if vim.opt.diff:get() then
  keymap("n", "<leader>1", ":diffget LOCAL<CR>", { silent = true, desc = "Take Local" })
  keymap("n", "<leader>2", ":diffget BASE<CR>", { silent = true, desc = "Take Base" })
  keymap("n", "<leader>3", ":diffget REMOTE<CR>", { silent = true, desc = "Take Remote" })
end

keymap("n", "<leader>cj", "<cmd>%!jq<cr>", { silent = true, desc = "Format JSON" })
keymap("n", "<leader>cJ", "<cmd>%!jq -c<cr>", { silent = true, desc = "Compact Format JSON" })

keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true, desc = "Format" })

keymap("n", "<F10>", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, { silent = true, desc = "" })

keymap("n", "<F11>", function()
  if vim.o.concealcursor == "n" then
    vim.o.concealcursor = ""
  else
    vim.o.concealcursor = "n"
  end
end, { silent = true, desc = "" })

vim.g.tmux_resizer_resize_count = 2
vim.g.tmux_resizer_vertical_resize_count = 2
vim.g.tmux_resizer_no_mappings = 1
keymap("n", "<C-M-k>", "<cmd>:TmuxResizeUp<CR>", { silent = true })
keymap("n", "<C-M-j>", "<cmd>:TmuxResizeDown<CR>", { silent = true })
keymap("n", "<C-M-h>", "<cmd>:TmuxResizeLeft<CR>", { silent = true })
keymap("n", "<C-M-l>", "<cmd>:TmuxResizeRight<CR>", { silent = true })

vim.api.nvim_create_user_command("DiffCommitLine", function()
  require("telescope").extensions.advanced_git_search.diff_commit_line()
end, { range = true })
keymap("v", "<leader>gdl", ":DiffCommitLine<CR>", { noremap = true, desc = "Commits That Affected The Selected Lines" })
keymap("n", "<leader>gdl", function()
  require("telescope").extensions.advanced_git_search.search_log_content()
end, { noremap = true, desc = "Search Log Contents" })

keymap("n", "<leader>cl", function()
  util.toggle("relativenumber")
end, { silent = true, desc = "Toggle Relative Line Numbers" })

keymap("n", "<leader>bx", ":%bd|e#|bd#<cr>|'<cr>", { desc = "Delete Other Buffers" })