vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme kanagawa")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.autoread = true

vim.opt.showtabline = 0
vim.opt.tabstop = 2
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

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

vim.opt.helpheight = 30
vim.opt.fillchars = {
	horiz = "─",
	horizup = "⏊",
	horizdown = "┳",
	vert = "│",
	vertleft = " ",
	vertright = "┣",
	verthoriz = "╋",
	diff = "╱",
	eob = " ",
	foldclose = "",
	foldopen = "",
	fold = " ",
	foldsep = " ",
	msgsep = "─",
}

vim.o.foldcolumn = "auto"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.autoindent = true

vim.opt.formatoptions = vim.opt.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore
if vim.fn.executable("rg") then
	-- if ripgrep installed, use that as a grepper
	vim.opt.grepprg = "rg --vimgrep --no-heading"
	vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end
