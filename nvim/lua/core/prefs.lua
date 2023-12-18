vim.opt.termguicolors = true
vim.cmd("colorscheme kanagawa")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.autoread = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.shiftwidth = 4
vim.expandtab = true

vim.opt.updatetime = 100
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.showmode = false

vim.opt.conceallevel = 0
vim.opt.colorcolumn = "120"

vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 4

vim.opt.colorcolumn = "80"
